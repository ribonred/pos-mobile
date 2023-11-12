import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../../app/constants/app_colors.dart';
import '../../../app/constants/app_text_style.dart';
import '../../../app/widgets/widgets.dart';
import '../../home/views/views.dart';
import '../controller/qr_controller.dart';

class ScanScreen extends StatelessWidget {
  static const String route = '/scan_screen';

  final qrController = Get.find<QRController>();
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  ScanScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            backgroundColor: AppColors.primaryOrange,
            body: Stack(
              children: [
                SafeArea(
                  child: Column(
                    children: [
                      AppHeader(
                        iconColor: Colors.white,
                        actions: [
                          IconButton(
                            icon: const Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.white,
                              size: 30,
                            ),
                            onPressed: () => Get.offAllNamed(HomeScreen.route),
                            tooltip: 'Go to HomeScreen',
                          ),
                        ],
                      ),
                      AppText(
                        'Scan QR Code',
                        style: AppTextStyle.title1.copyWith(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 20),
                      AppText(
                        "Please move the camera\nover another device's screen",
                        style: AppTextStyle.body2.copyWith(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 35),
                      SizedBox(
                        height: 400,
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16.0),
                            child: _buildQrView(context),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
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
        cutOutSize: scanArea,
      ),
      onPermissionSet: qrController.onPermissionSet,
    );
  }

  static void open(BuildContext context) => Navigator.pushNamed(context, route);
}
