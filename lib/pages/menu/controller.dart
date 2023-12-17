import 'package:get/get.dart';

import '../../models/models.dart';
import '../../providers/providers.dart';
import '../../services/services.dart';
import '../pages.dart';

class MenuItemController extends GetxController {
  static MenuItemController get to => Get.find();

  final DatabaseService db = Get.find();
  final OrdersProvider api = Get.find();

  int qty = 1;

  void updateQty(int value) {
    qty = value;
    update();
  }

  void addToCart(Menu menu) async {
    Order order = Order(product: menu.id, quantity: qty);

    if (await api.createOrder(order)) {
      Get.toNamed(CartPage.routeName);
    }
  }
}
