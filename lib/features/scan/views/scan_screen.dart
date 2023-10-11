import 'package:flutter/material.dart';
import 'package:menu_barcode_apps/app/constants/app_text_style.dart';
import 'package:menu_barcode_apps/app/constants/images.dart';
import 'package:menu_barcode_apps/app/widgets/widgets.dart';
import 'package:menu_barcode_apps/features/home/views/views.dart';

import '../../../app/constants/app_colors.dart';
import 'qr.dart';

class ScanScreen extends StatelessWidget {
  const ScanScreen({Key? key}) : super(key: key);

  static const String route = '/scan_screen';
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(),
      child: Builder(builder: (context) {
        return Scaffold(
            backgroundColor: AppColors.primaryOrange,
            body: Stack(
              children: [
                SafeArea(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Expanded(
                              child: AppHeader(iconColor: Colors.white)),
                          IconButton(
                            icon: const Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.white,
                              size: 30,
                            ),
                            onPressed: () =>
                                HomeScreen.openAndRemoveAllRoute(context),
                            tooltip: 'Go to HomeScreen',
                          )
                        ],
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 34),
                            child: Column(
                              children: [
                                AppText(
                                  'Scan QR Code',
                                  style: AppTextStyle.title1.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(height: 20),
                                AppText(
                                  "Please move the camera\nover another device's screen",
                                  style: AppTextStyle.body2
                                      .copyWith(color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 35),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: getPngImage(AppImages.qrCode),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      AppButton(
                        margin: const EdgeInsets.fromLTRB(34, 0, 34, 50),
                        label: 'Scan Here',
                        onTap: () => QRViewExample.open(context),
                        useBorder: true,
                      ),
                    ],
                  ),
                )
              ],
            ));
      }),
    );
  }

  static void open(BuildContext context) => Navigator.pushNamed(context, route);
}
