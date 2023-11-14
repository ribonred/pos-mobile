import 'package:get/get.dart';

import '../../providers/pos_api.dart';
import 'controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => POSAPIProvider());
    Get.put(HomeController());
  }
}
