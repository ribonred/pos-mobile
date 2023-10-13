import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menu_barcode_apps/features/home/home.dart';

import '../../../app/constants/app_colors.dart';
import '../../../app/constants/icons.dart';
import '../views/tab/bottom_tab_controller.dart';

class AppBottomTab extends StatelessWidget {
  const AppBottomTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      color: AppColors.primaryOrange,
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () => BottomTabController.to.onChangedTab(TabPage.menu),
              child: const Icon(
                Icons.home_outlined,
                color: Colors.white,
                size: 30,
              ),
            ),
            GestureDetector(
              onTap: () => BottomTabController.to.onChangedTab(TabPage.search),
              child: getSvgImage(AppIcons.search, color: Colors.white),
            ),
            GestureDetector(
              onTap: () =>
                  BottomTabController.to.onChangedTab(TabPage.favorite),
              child: getSvgImage(AppIcons.love, color: Colors.white),
            ),
            GestureDetector(
              onTap: () => Get.toNamed(CartScreen.route),
              child: const Icon(
                Icons.trolley,
                color: Colors.white,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
