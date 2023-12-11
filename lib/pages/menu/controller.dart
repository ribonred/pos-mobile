import 'package:get/get.dart';

import '../../models/models.dart';
import '../../providers/pos_api.dart';
import '../../services/database.dart';
import '../pages.dart';

class MenuItemController extends GetxController {
  static MenuItemController get to => Get.find();

  final DatabaseServices db = Get.find();
  final POSAPIProvider api = Get.find();

  int qty = 1;

  void updateQty(int value) {
    qty = value;
    update();
  }

  void addToCart(Menu menu) async {
    Order order = Order(
      product: menu.id,
      quantity: qty,
    );
    String sessionId = db.session.get('sessionId')!;

    bool success = await api.createOrder(order, sessionId);

    if (success) {
      Get.toNamed(CartPage.routeName);
    }
  }
}
