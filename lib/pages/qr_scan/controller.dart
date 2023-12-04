import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../models/models.dart';
import '../../providers/pos_api.dart';
import '../../services/database.dart';

class QRScanController extends GetxController {
  final DatabaseServices db = Get.find();
  final POSAPIProvider api = Get.find();

  final RxString qrData = ''.obs;
  final RxBool hasSessionData = false.obs;
  final RxBool isLoading = false.obs;

  void updateSession(String sessionId, String merchantId) {
    hasSessionData.value = true;

    db.session.put('sessionId', sessionId);
    db.session.put('merchantId', merchantId);
  }

  Future<void> onDetect(BarcodeCapture result) async {
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

    updateSession(response.orderSession, response.data.merchantId);
    isLoading.value = false;
  }
}
