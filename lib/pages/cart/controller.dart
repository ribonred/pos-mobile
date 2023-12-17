import 'package:get/get.dart';

import '../../models/models.dart';
import '../../providers/pos_api.dart';
import '../../services/database.dart';

class CartController extends GetxController {
  final DatabaseService db = Get.find();
  final POSAPIProvider api = Get.find();

  late final String sessionId;

  List<OrderItem>? items;
  String total = '0.00';

  @override
  void onInit() {
    super.onInit();

    setSessionId();
  }

  void setSessionId() {
    sessionId = db.session.get('sessionId')!;
  }

  void refreshItems() async {
    OrderResponse? response = await api.getOrders(sessionId);

    if (response != null && response.results.isNotEmpty) {
      items = response.results[0].items;
      total = response.results[0].orderTotal;

      // avoid cart item moving around on quantity change
      items?.sort((a, b) => a.id.compareTo(b.id));

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
