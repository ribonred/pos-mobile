import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:menu_barcode_apps/app/constants/images.dart';

import '../../../app/constants/app_colors.dart';
import '../../../app/constants/app_text_style.dart';
import '../../../app/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String route = '/HomeScreen_screen';
  static void open(BuildContext context) => Navigator.pushNamed(context, route);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    /// whenever your initialization is completed, remove the splash screen:
    Future.delayed(const Duration(seconds: 2))
        .then((value) => {FlutterNativeSplash.remove()});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryOrange,
      body: Stack(
        children: [
          Align(
              alignment: Alignment.topRight,
              child: getPngImage(AppImages.beefOnPlate)),
          Align(
              alignment: Alignment.bottomLeft,
              child: getPngImage(
                AppImages.bottomHomeBg,
                blendMode: BlendMode.srcOut,
              )),
          SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                        text: 'Your',
                        children: const [
                          TextSpan(
                              text: ' Food\n',
                              style: TextStyle(fontWeight: FontWeight.w600)),
                          TextSpan(text: 'is Waiting\n'),
                          TextSpan(
                              text: 'For You',
                              style: TextStyle(fontWeight: FontWeight.w600)),
                        ],
                        style: AppTextStyle.display.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            height: 1.3),
                        // textAlign: TextAlign.center,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                AppButton(
                  margin: const EdgeInsets.fromLTRB(34, 0, 34, 50),
                  variant: AppButtonVariant.primary,
                  label: 'Scan QR Code',
                  onTap: () {},
                  suffixIcon: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
