import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/route.generator.dart';

enum TabPage {
  menu('Menu'),
  search('Search'),
  favorite('Favorite'),
  cart('Cart'),
  foodMenu('Food Menu'),
  promo('Promo'),
  snack('Snack'),
  drink('Drink'),
  empty('');

  final String name;
  const TabPage(this.name);
}

class BottomTabController extends GetxController {
  final indexTab = 0.obs;
  final selectedTab = TabPage.menu.obs;

  static BottomTabController get to => Get.find();

  void onChangedTab(TabPage page) {
    selectedTab.value = page;
    update();
  }

  void backToMenu() {
    selectedTab.value = TabPage.menu;
    update();
  }

  navigatorPage(String route) {
    print({'navigatorPage triggered': route});
    Navigator(
      key: Key(route),
      onGenerateRoute: RouterGenerator.generateRoute,
      initialRoute: route,
    );
    update();
  }
}
