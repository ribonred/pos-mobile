import 'package:flutter/material.dart';
import 'package:menu_barcode_apps/app/constants/images.dart';

import '../../views/tab/bottom_tab_controller.dart';

class MenuCategoryModel {
  final String name;
  final String icon;
  final TabPage tabPage;
  MenuCategoryModel({
    required this.name,
    required this.icon,
    required this.tabPage,
  });
}

List<MenuCategoryModel> menuCategories(BuildContext context) {
  return [
    MenuCategoryModel(
      name: 'Food',
      icon: AppImages.foodIcon,
      tabPage: TabPage.foodMenu,
    ),
    MenuCategoryModel(
      name: 'Promo',
      icon: AppImages.favIcon,
      tabPage: TabPage.promo,
    ),
    MenuCategoryModel(
      name: 'Snack',
      icon: AppImages.snackIcon,
      tabPage: TabPage.snack,
    ),
    MenuCategoryModel(
      name: 'Drink',
      icon: AppImages.drinkIcon,
      tabPage: TabPage.drink,
    ),
  ];
}
