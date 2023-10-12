import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:menu_barcode_apps/app/constants/icons.dart';
import 'package:menu_barcode_apps/features/home/home.dart';
import 'package:menu_barcode_apps/features/home/views/menu_screen.dart';
import 'package:menu_barcode_apps/features/home/views/search_screen.dart';

import '../../../app/constants/app_colors.dart';
import 'tab/bloc/tab_bloc.dart';

class HomeScreen extends StatelessWidget {
  static const String route = 'home_screen';
  static void open(BuildContext context) => Navigator.pushNamed(context, route);
  static void openAndRemoveAllRoute(BuildContext context) =>
      Navigator.pushNamedAndRemoveUntil(
          context, route, (Route<dynamic> route) => false);
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TabBloc(),
      child: Scaffold(
        backgroundColor: AppColors.primaryOrange,
        body: Container(
          padding: const EdgeInsets.fromLTRB(34, 0, 34, 0),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30))),
          child: SafeArea(
            child: BlocBuilder<TabBloc, TabState>(
              buildWhen: (previous, current) =>
                  previous.selectedTab != current.selectedTab,
              builder: (context, state) {
                switch (state.selectedTab) {
                  case TabPage.search:
                    return const SearchScreen();
                  case TabPage.favorite:
                    return const FavoriteScreen();
                  case TabPage.cart:
                    return const CartScreen();
                  case TabPage.foodMenu:
                    return const FoodCategory();
                  case TabPage.promo:
                    return const PromoCategories();
                  case TabPage.snack:
                    return const SnackCategories();
                  case TabPage.drink:
                    return const DrinkCategories();
                  default:
                    return const MenuScreen();
                }
              },
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          color: AppColors.primaryOrange,
          notchMargin: 20,
          child: BlocBuilder<TabBloc, TabState>(
            buildWhen: (previous, current) =>
                previous.selectedTab != current.selectedTab,
            builder: (context, state) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () => context
                        .read<TabBloc>()
                        .add(const OnChangedTab(TabPage.menu)),
                    child: const Icon(
                      Icons.home_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => context
                        .read<TabBloc>()
                        .add(const OnChangedTab(TabPage.search)),
                    child: getSvgImage(AppIcons.search, color: Colors.white),
                  ),
                  GestureDetector(
                    onTap: () => context
                        .read<TabBloc>()
                        .add(const OnChangedTab(TabPage.favorite)),
                    child: getSvgImage(AppIcons.love, color: Colors.white),
                  ),
                  GestureDetector(
                    onTap: () => context
                        .read<TabBloc>()
                        .add(const OnChangedTab(TabPage.cart)),
                    child: const Icon(
                      Icons.trolley,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
