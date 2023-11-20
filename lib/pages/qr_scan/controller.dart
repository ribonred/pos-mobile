import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../models/pos_responses.dart';
import '../../providers/pos_api.dart';

class QRScanController extends GetxController {
  final POSAPIProvider api = Get.find();
  final MobileScannerController cameraController = MobileScannerController(
    autoStart: false,
  );

  final RxString qrData = ''.obs;
  final RxString merchantId = ''.obs;
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    cameraController.start();
  }

  Future<void> onDetect(BarcodeCapture result) async {
    // stop scan after first result
    cameraController.stop();

    Barcode barcode = result.barcodes.first;
    if (barcode.rawValue == null) {
      return;
    }

    qrData.value = barcode.rawValue!;

    isLoading.value = true;
    QRResponse? response = await api.translateQR(qrData.value);
    if (response == null) {
      isLoading.value = false;
      return;
    }

    merchantId.value = response.data.merchantId;
    isLoading.value = false;
  }
}
