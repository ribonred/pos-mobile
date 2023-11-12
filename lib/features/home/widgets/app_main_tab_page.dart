import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/route.generator.dart';
import '../views/menu_screen.dart';
import '../views/search_screen.dart';
import '../views/tab/bottom_tab_controller.dart';
import '../views/views.dart';

class AppMainTabPage extends StatelessWidget {
  const AppMainTabPage({super.key});
  @override
  Widget build(BuildContext context) {
    final bottomTabController = Get.put(BottomTabController());

    return GetBuilder<BottomTabController>(
      builder: (_) {
        switch (bottomTabController.selectedTab.value) {
          case TabPage.search:
            return _navigatorPage(SearchScreen.route);
          case TabPage.favorite:
            return _navigatorPage(FavoriteScreen.route);
          case TabPage.cart:
            return _navigatorPage(CartScreen.route);
          case TabPage.foodMenu:
            return _navigatorPage(FoodScreen.route);
          case TabPage.promo:
            return _navigatorPage(PromoScreen.route);
          case TabPage.snack:
            return _navigatorPage(SnackScreen.route);
          case TabPage.drink:
            return _navigatorPage(DrinkScreen.route);
          case TabPage.empty:
            return const SizedBox.shrink();
          default:
            return _navigatorPage(MenuScreen.route);
        }
      },
    );
  }

  Widget _navigatorPage(String route) => Navigator(
        key: Key(route),
        onGenerateRoute: RouterGenerator.generateRoute,
        initialRoute: route,
      );
}
