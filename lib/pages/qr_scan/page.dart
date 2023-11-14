import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../components/components.dart';
import '../../utils/asset_images.dart';
import '../../utils/colors.dart';
import 'controller.dart';

class QRScanPage extends GetView<QRScanController> {
  static const String routeName = '/qr_scan';

  const QRScanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryOrange,
      body: Stack(
        children: [
          Column(
            children: [
              SafeArea(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 0.0),
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: () => Get.back(),
                    color: Colors.white,
                    icon: const Icon(
                      Icons.arrow_back_ios,
                    ),
                  ),
                ),
              ),
              Text(
                "Scan QR Code",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Colors.white,
                    ),
              ),
              const Spacing.small(),
              Text(
                "Please move the camera\nover another device's screen",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.white,
                    ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Align(
            alignment: Alignment.center,
            child: Hero(
              tag: 'scan-text',
              child: Container(
                width: (3 / 4) * Get.width,
                height: .5 * Get.height,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.3),
                      offset: const Offset(0.0, 4.0),
                      blurRadius: 24.0,
                    )
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24.0),
                  child: MobileScanner(
                    onDetect: controller.onDetect,
                    placeholderBuilder: (context, widget) {
                      return Image.asset(AssetImages.barcode);
                    },
                    errorBuilder: (context, error, widget) {
                      Get.log(error.errorDetails?.message ?? '');
                      return Image.asset(AssetImages.barcode);
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
