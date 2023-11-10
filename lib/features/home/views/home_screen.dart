import 'package:flutter/material.dart';

import '../../../app/constants/app_colors.dart';
import '../widgets/app_main_tab_page.dart';
import '../widgets/bottom_tab.dart';

class HomeScreen extends StatelessWidget {
  static const String route = '/home_screen';

  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryOrange,
      body: const AppMainTabPage(),
      bottomNavigationBar: AppBottomTab(),
    );
  }

  static void open(BuildContext context) => Navigator.pushNamed(context, route);

  static void openAndRemoveAllRoute(BuildContext context) =>
      Navigator.pushNamedAndRemoveUntil(
          context, route, (Route<dynamic> route) => false);
}
