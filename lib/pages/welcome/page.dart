import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../components/components.dart';
import '../../utils/asset_images.dart';
import '../../utils/colors.dart';
import '../pages.dart';

class WelcomePage extends StatefulWidget {
  static const String routeName = '/welcome';

  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  void checkPermission() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.camera,
      Permission.contacts,
    ].request();

    for (Permission permission in statuses.keys) {
      if (statuses[permission]!.isDenied) {
        await permission.request();
      }

      if (statuses[permission]!.isPermanentlyDenied) {
        Get.defaultDialog(
          onConfirm: () {
            Get.back();
            openAppSettings();
          },
          title:
              "${permission.toString().split(".")[1].capitalize!} permission required",
          middleText: "Please tap OK to go to app settings to grant permission",
          barrierDismissible: false,
        );
      }
    }

    if (statuses.keys.every((element) => statuses[element]!.isGranted)) {
      Get.toNamed(QRScanPage.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryOrange,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Image.asset(AssetImages.beefSteak),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset(
              AssetImages.foodVector,
              colorBlendMode: BlendMode.srcOver,
            ),
          ),
          SafeArea(
            child: Center(
              child: RichText(
                text: TextSpan(
                  text: 'Your',
                  children: const [
                    TextSpan(
                      text: ' Food\n',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    TextSpan(text: 'Is Waiting\n'),
                    TextSpan(
                      text: 'For You',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        height: 1.3,
                      ),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(24.0),
              width: double.infinity,
              child: AppButton(
                label: 'Scan QR Code',
                trailing: const Icon(Icons.arrow_forward_ios),
                onPressed: checkPermission,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
