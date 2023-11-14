import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../services/database.dart';
import '../pages.dart';

class QRScanController extends GetxController {
  final DatabaseServices db = Get.find();
  final MobileScannerController cameraController = MobileScannerController(
    autoStart: false,
  );

  @override
  void onInit() {
    super.onInit();
    cameraController.start();
  }

  @override
  void dispose() {
    cameraController.stop();
    super.dispose();
  }

  Future<void> onDetect(BarcodeCapture result) async {
    if (result.barcodes.isEmpty) {
      return;
    }

    Barcode barcode = result.barcodes.last;
    String? qrData = barcode.rawValue;
    if (qrData == null) {
      return;
    }

    await db.settings.put('qrData', qrData);
    Get.offAllNamed(HomePage.routeName);
  }
}
