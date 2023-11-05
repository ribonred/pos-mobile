import 'package:get/get.dart';
import 'package:menu_barcode_apps/features/scan/controller/qr_controller.dart';

class QRBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => QRController());
  }
}
