import 'package:get/get.dart';

import '../../models/models.dart';
import '../../providers/providers.dart';
import '../pages.dart';

class MenuItemController extends GetxController {
  static MenuItemController get to => Get.find();

  final OrdersProvider api = Get.find();

  int qty = 1;

  void updateQty(int value) {
    qty = value;
    update();
  }

  void addToCart(Menu menu) async {
    Order order = Order(product: menu.id, quantity: qty);

    bool success = await api.createOrder(order);
    if (success) Get.toNamed(CartPage.routeName);
  }
}
