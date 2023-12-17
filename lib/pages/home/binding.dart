import 'package:get/get.dart';

import '../../controllers/controllers.dart';
import 'controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => POSController(), fenix: true);
    Get.put(HomeController());
  }
}
