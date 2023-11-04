import 'package:flutter/material.dart';
import 'package:menu_barcode_apps/features/home/widgets/app_main_tab_page.dart';
import 'package:menu_barcode_apps/features/home/widgets/bottom_tab.dart';

import '../../../app/constants/app_colors.dart';

class HomeScreen extends StatelessWidget {
  static const String route = '/home_screen';
  static void open(BuildContext context) => Navigator.pushNamed(context, route);
  static void openAndRemoveAllRoute(BuildContext context) =>
      Navigator.pushNamedAndRemoveUntil(
          context, route, (Route<dynamic> route) => false);
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0.0,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      backgroundColor: AppColors.primaryOrange,
      body: const Column(
        children: [AppMainTabPage()],
      ),
      bottomNavigationBar: const AppBottomTab(),
    );
  }
}
