// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:menu_barcode_apps/app/constants/images.dart';
import 'package:menu_barcode_apps/features/home/home.dart';

import '../views/tab/bloc/tab_bloc.dart';

class MenuCategoryModel {
  final String name;
  final String icon;
  final TabPage tabPage;
  final VoidCallback action;
  MenuCategoryModel({
    required this.name,
    required this.icon,
    required this.tabPage,
    required this.action,
  });
}

List<MenuCategoryModel> menuCategories(BuildContext context) {
  return [
    MenuCategoryModel(
        name: 'Food',
        icon: AppImages.foodIcon,
        tabPage: TabPage.foodMenu,
        action: () => FoodCategory.open(context)),
    MenuCategoryModel(
        name: 'Promo',
        icon: AppImages.favIcon,
        tabPage: TabPage.promo,
        action: () => PromoCategories.open(context)),
    MenuCategoryModel(
        name: 'Snack',
        icon: AppImages.snackIcon,
        tabPage: TabPage.snack,
        action: () => SnackCategories.open(context)),
    MenuCategoryModel(
        name: 'Drink',
        icon: AppImages.drinkIcon,
        tabPage: TabPage.drink,
        action: () => DrinkCategories.open(context)),
  ];
}
