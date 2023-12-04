import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../components/components.dart';
import '../../utils/asset_images.dart';
import '../../utils/colors.dart';
import '../pages.dart';

class QRScanPage extends StatefulWidget {
  static const String routeName = '/qr_scan';

  const QRScanPage({super.key});

  @override
  State<QRScanPage> createState() => _QRScanPageState();
}

class _QRScanPageState extends State<QRScanPage>
    with SingleTickerProviderStateMixin {
  final QRScanController controller = Get.find();
  final MobileScannerController scanController = MobileScannerController(
    formats: [BarcodeFormat.qrCode],
    detectionSpeed: DetectionSpeed.noDuplicates,
    returnImage: true,
  );

  BarcodeCapture? barcode;
  MobileScannerArguments? arguments;

  void _onDetect(BarcodeCapture result) {
    setState(() => barcode = result);
    controller.onDetect(result);
  }

  @override
  void dispose() {
    scanController.dispose();
    super.dispose();
  }

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
            ],
          ),
          Align(
            alignment: Alignment.center,
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
                child: barcode?.image != null
                    ? Image.memory(
                        barcode!.image!,
                        fit: BoxFit.cover,
                      )
                    : _buildScannerWindow(),
              ),
            ),
          ),
          _messageWidgetBuilder(context),
        ],
      ),
    );
  }

  Stack _buildScannerWindow() {
    return Stack(
      children: [
        MobileScanner(
          controller: scanController,
          fit: BoxFit.cover,
          onDetect: _onDetect,
          errorBuilder: (context, error, child) {
            return Image.asset(AssetImages.barcode);
          },
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Row(
            children: [
              IconButton(
                color: Colors.white,
                icon: ValueListenableBuilder<TorchState>(
                  valueListenable: scanController.torchState,
                  builder: (context, state, child) {
                    switch (state) {
                      case TorchState.off:
                        return const Icon(
                          Icons.flash_off_rounded,
                          color: Colors.grey,
                        );
                      case TorchState.on:
                        return const Icon(
                          Icons.flash_on_rounded,
                          color: Colors.yellow,
                        );
                    }
                  },
                ),
                onPressed: () => scanController.toggleTorch(),
              ),
              const Spacer(),
              IconButton(
                color: Colors.white,
                icon: ValueListenableBuilder<CameraFacing>(
                  valueListenable: scanController.cameraFacingState,
                  builder: (context, state, child) {
                    switch (state) {
                      case CameraFacing.front:
                        return const Icon(Icons.camera_front);
                      case CameraFacing.back:
                        return const Icon(Icons.camera_rear);
                    }
                  },
                ),
                onPressed: () => scanController.switchCamera(),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _messageWidgetBuilder(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: GetX<QRScanController>(
          builder: (QRScanController controller) {
            String qrData = controller.qrData.value;
            bool hasSessionData = controller.hasSessionData.value;
            bool isLoading = controller.isLoading.value;

            bool isStarting = qrData.isEmpty;
            bool gettingMerchant = qrData.isNotEmpty && isLoading;
            bool merchantNotFound =
                qrData.isNotEmpty && !isLoading && !hasSessionData;
            bool sessionStarted =
                qrData.isNotEmpty && !isLoading && hasSessionData;

            String message = '';
            if (isStarting) {
              message = 'Please move the camera\nover another device\'s screen';
            } else if (gettingMerchant) {
              message = 'QR code found, getting merchant information...';
            } else if (merchantNotFound) {
              message = 'Merchant cannot be found...';
            }

            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                !sessionStarted
                    ? Text(
                        message,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.white,
                            ),
                      )
                    : AppButton(
                        label: 'Proceed',
                        trailing: const Icon(Icons.arrow_forward_ios),
                        outlined: true,
                        backgroundColor: Colors.white,
                        proceedDelay: 5,
                        onPressed: () => Get.offAllNamed(HomePage.routeName),
                      )
              ],
            );
          },
        ),
      ),
    );
  }
}
