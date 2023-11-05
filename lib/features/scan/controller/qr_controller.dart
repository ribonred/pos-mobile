import 'dart:developer';

import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../../core/widgets/custom_snack_bar.dart';

class QRController extends GetxController {
  QRViewController? qrViewController;
  Rx<Barcode?> result = null.obs;

  void onQRViewCreated(QRViewController controller) {
    qrViewController = controller;
    controller.scannedDataStream.listen((scanData) {
      result.value = scanData;
    });
  }

  void onPermissionSet(QRViewController ctrl, bool isPermissionSet) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $isPermissionSet');
    if (!isPermissionSet) {
      CustomSnackBar.showError(message: 'No Permission');
    }
  }

  @override
  void dispose() {
    qrViewController?.dispose();
    super.dispose();
  }
}
