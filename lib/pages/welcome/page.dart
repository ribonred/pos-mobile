import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/components.dart';
import '../../utils/asset_images.dart';
import '../../utils/colors.dart';
import '../pages.dart';

class WelcomePage extends StatelessWidget {
  static const String routeName = '/welcome';

  const WelcomePage({super.key});

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
                onPressed: () {
                  Get.toNamed(QRScanPage.routeName);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
