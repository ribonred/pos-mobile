import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menu_barcode_apps/features/scan/controller/qr_controller.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRViewExample extends StatelessWidget {
  static const String route = '/qr_view_screen';

  QRViewExample({super.key});

  final qrController = Get.find<QRController>();
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(flex: 4, child: _buildQrView(context)),
          Expanded(
            flex: 1,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Obx(
                  () {
                    if (qrController.result.value != null) {
                      return Text(
                        'Source: ${qrController.result.value?.code}',
                        style: const TextStyle(
                          color: Color.fromARGB(255, 255, 111, 0),
                        ),
                      );
                    } else {
                      return const Text(
                        'Scan barcode',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 111, 0),
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 250.0
        : 400.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: qrController.onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: const Color.fromARGB(255, 255, 122, 0),
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: qrController.onPermissionSet,
    );
  }
}
