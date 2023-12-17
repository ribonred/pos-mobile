import 'package:get/get.dart';

import '../../providers/providers.dart';

class CartController extends GetxController {
  static CartController get to => Get.find();

  final OrdersProvider api = Get.find();

  void updateQty(int id, int count) => api.updateOrder(id, count);
  void deleteItem(int id) => api.deleteOrder(id);
}
