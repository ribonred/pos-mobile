// import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../models/models.dart';
import '../../providers/pos_api.dart';
import '../../services/database.dart';

class CartController extends GetxController {
  final DatabaseServices db = Get.find();
  final POSAPIProvider api = Get.find();

  late final WebSocketChannel? channel;
  late final String sessionId;

  List<OrderItem> items = [];
  String total = '0';

  @override
  void onInit() {
    super.onInit();

    setSessionId();
    connectWebsocket();
  }

  @override
  void onClose() {
    channel?.sink.close();
    super.onClose();
  }

  void setSessionId() {
    sessionId = db.session.get('sessionId')!;
  }

  void connectWebsocket() {
    // String url = '${dotenv.env['POS_API_URL']}order/';
    // url = url.replaceFirst('http', 'ws');

    // channel = WebSocketChannel.connect(Uri.parse(url));

    channel = null;
  }

  void refreshItems() async {
    OrderResponse? response = await api.getOrders(sessionId);

    if (response != null && response.results.isNotEmpty) {
      items = response.results[0].items;
      total = response.results[0].total;
      update();
    }
  }

  void updateItemCount(int id, int count) async {
    await api.updateOrder(id, count, sessionId);
    refreshItems();
  }

  void deleteItem(int id) async {
    await api.deleteOrder(id, sessionId);
    refreshItems();
  }
}
