import 'package:get/get.dart';

import 'menu.dart';

class MenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MenuItemController());
  }
}
