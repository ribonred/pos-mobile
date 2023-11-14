import 'package:get/get.dart';

import 'controller.dart';

class QRScanBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(QRScanController());
  }
}
