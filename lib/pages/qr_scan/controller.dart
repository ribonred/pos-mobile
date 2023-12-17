import 'dart:async';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../models/models.dart';
import '../../providers/providers.dart';
import '../../services/services.dart';

class QRScanController extends GetxController {
  final DatabaseService db = Get.find();
  final MerchantProvider api = Get.find();

  final RxString qrData = ''.obs;
  final RxBool hasSessionData = false.obs;
  final RxBool isLoading = false.obs;

  Future<String?> getEmail() async {
    const platform = MethodChannel('net.soberdev.pos.client/email');
    return await platform.invokeMethod('getAccountEmail');
  }

  void updateSession(String sessionId, String merchantId, {String? email}) {
    hasSessionData.value = true;

    db.session.put('sessionId', sessionId);
    db.session.put('merchantId', merchantId);

    if (email != null) db.session.put('userEmail', email);
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

    String? userEmail = await getEmail();
    updateSession(
      response.orderSession,
      response.data.merchantId,
      email: userEmail,
    );
    isLoading.value = false;
  }
}
