import 'package:flutter/material.dart';
import 'package:menu_barcode_apps/app/constants/images.dart';
import 'package:menu_barcode_apps/features/home/home.dart';

class MenuCategoryModel {
  final String name;
  final String icon;
  final VoidCallback action;
  MenuCategoryModel(
      {required this.name, required this.icon, required this.action});
}

List<MenuCategoryModel> menuCategories(BuildContext context) {
  return [
    MenuCategoryModel(
        name: 'Food',
        icon: AppImages.foodIcon,
        action: () => FoodCategory.open(context)),
    MenuCategoryModel(
        name: 'Promo',
        icon: AppImages.favIcon,
        action: () => PromoCategories.open(context)),
    MenuCategoryModel(
        name: 'Snack',
        icon: AppImages.snackIcon,
        action: () => SnackCategories.open(context)),
    MenuCategoryModel(
        name: 'Drink',
        icon: AppImages.drinkIcon,
        action: () => DrinkCategories.open(context)),
  ];
}
