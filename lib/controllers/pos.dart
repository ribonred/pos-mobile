import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../models/models.dart';
import '../providers/providers.dart';
import '../services/services.dart';
import '../utils/utils.dart';

class POSController extends GetxController {
  static POSController get to => Get.find();

  final DatabaseService db = Get.find();
  final MerchantProvider merchantApi = Get.find();
  final OrdersProvider ordersApi = Get.find();

  String? get merchantId => db.session.get('merchantId');
  String? get sessionId => db.session.get('sessionId');

  late WebSocketChannel channel;

  List<Menu>? menu;
  List<Map> menuCategories = [
    {'name': 'Food', 'icon': AssetImages.foodIcon, 'category': 'food'},
    {'name': 'Promo', 'icon': AssetImages.favIcon, 'category': 'promo'},
    {'name': 'Snack', 'icon': AssetImages.snackIcon, 'category': 'snack'},
    {'name': 'Drinks', 'icon': AssetImages.drinkIcon, 'category': 'drinks'},
  ];

  List<OrderItem> cart = [];
  String total = '0.00';

  @override
  void onInit() {
    super.onInit();

    String? posUrl = dotenv.env['POS_API_URL']?.replaceFirst('http', 'ws');
    var websocketUrl = Uri.parse('$posUrl/order/');
    channel = WebSocketChannel.connect(websocketUrl);

    channel.stream.listen(updateCart);
    startCartUpdate();
  }

  @override
  void onClose() {
    channel.sink.close();
    super.onClose();
  }

  Future getMenu() async {
    menu = null;
    update();

    if (merchantId != null || merchantId != '') {
      menu = await merchantApi.getMenu(merchantId!) ?? [];
      update(['menuChanged']);
    }
  }

  void getCartData() async {
    OrderResponse? response = await ordersApi.getOrders();

    if (response != null && response.results.isNotEmpty) {
      cart = response.results[0].items;
      total = response.results[0].orderTotal;

      // avoid cart item moving around on quantity change
      cart.sort((a, b) => a.id.compareTo(b.id));

      update(['cartChanged']);
    }
  }

  void startCartUpdate() async {
    channel.ready.then((value) {
      Map<String, String> initMessage = {
        'request_id': '$sessionId-${DateTime.now().toIso8601String()}',
        'action': 'subscribe_instance',
        'pk': sessionId!,
      };
      channel.sink.add(json.encode(initMessage));
    });
  }

  void updateCart(dynamic data) {
    WebsocketUpdate websocketUpdate = WebsocketUpdate.fromJsonString(data);
    if (websocketUpdate.action == UpdateAction.update) {
      WebsocketOrder updateData = WebsocketOrder.fromJson(websocketUpdate.data);

      cart = updateData.items.map((e) {
        Menu? menuItem = menu?.where((item) {
          return item.id == e.product;
        }).firstOrNull;

        return OrderItem(
          id: e.id,
          quantity: e.quantity,
          product: e.product,
          total: e.total,
          productName: menuItem?.name ?? '',
          productPrice: double.tryParse(menuItem?.price ?? '0.00') ?? 0.0,
          productImage: menuItem?.images.first,
        );
      }).toList();
      total = updateData.orderTotal;

      // remove empty items
      cart.removeWhere((item) => item.quantity == 0);

      // avoid cart item moving around on quantity change
      cart.sort((a, b) => a.id.compareTo(b.id));

      update(['cartChanged']);
    }
  }
}
