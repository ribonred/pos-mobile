import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../pages.dart';

class QRScanController extends GetxController {
  final MobileScannerController cameraController = MobileScannerController(
    autoStart: false,
  );

  @override
  void onInit() {
    super.onInit();
    cameraController.start();
  }

  Future<void> onDetect(BarcodeCapture result) async {
    // stop scan after first result
    cameraController.stop();

    Barcode barcode = result.barcodes.first;
    String? qrData = barcode.rawValue;
    if (qrData == null) {
      return;
    }

    Get.offAllNamed(HomePage.routeName, arguments: {'qrData': qrData});
  }
}
