import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/constants/app_colors.dart';
import '../views/tab/bottom_tab_controller.dart';

class AppBottomTab extends StatelessWidget {
  AppBottomTab({super.key});

  final BottomTabController c = Get.put(BottomTabController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      color: AppColors.primaryOrange,
      child: SafeArea(
        child: GetBuilder<BottomTabController>(
          builder: (_) {
            TabPage selectedTab = c.selectedTab.value;

            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () => c.onChangedTab(TabPage.menu),
                  icon: Icon(
                    selectedTab == TabPage.menu
                        ? Icons.home
                        : Icons.home_outlined,
                  ),
                  color: Colors.white,
                ),
                IconButton(
                  onPressed: () {
                    BottomTabController.to.onChangedTab(TabPage.search);
                  },
                  icon: Icon(
                    selectedTab == TabPage.search
                        ? Icons.search
                        : Icons.search_outlined,
                  ),
                  color: Colors.white,
                ),
                IconButton(
                  onPressed: () => c.onChangedTab(TabPage.favorite),
                  icon: Icon(
                    selectedTab == TabPage.favorite
                        ? Icons.favorite
                        : Icons.favorite_outline,
                  ),
                  color: Colors.white,
                ),
                IconButton(
                  onPressed: () => c.onChangedTab(TabPage.cart),
                  icon: Icon(selectedTab == TabPage.cart
                      ? Icons.shopping_basket
                      : Icons.shopping_basket_outlined),
                  color: Colors.white,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
