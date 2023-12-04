import 'package:get/get.dart';

import 'controller.dart';

class CashierConfirmationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CashierConfirmationController());
  }
}
