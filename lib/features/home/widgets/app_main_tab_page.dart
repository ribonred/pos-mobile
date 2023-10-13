import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/route.generator.dart';
import '../views/menu_screen.dart';
import '../views/search_screen.dart';
import '../views/tab/bloc/tab_bloc.dart';
import '../views/views.dart';

class AppMainTabPage extends StatelessWidget {
  const AppMainTabPage({super.key});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return BlocBuilder<TabBloc, TabState>(
          buildWhen: (previous, current) =>
              previous.selectedTab != current.selectedTab,
          builder: (context, state) {
            switch (state.selectedTab) {
              case TabPage.search:
                return _navigatorPage(SearchScreen.route);
              case TabPage.favorite:
                return _navigatorPage(FavoriteScreen.route);
              case TabPage.cart:
                return _navigatorPage(CartScreen.route);
              case TabPage.foodMenu:
                return _navigatorPage(FoodCategory.route);
              case TabPage.promo:
                return _navigatorPage(PromoCategories.route);
              case TabPage.snack:
                return _navigatorPage(SnackCategories.route);
              case TabPage.drink:
                return _navigatorPage(DrinkCategories.route);
              default:
                return const MenuScreen();
            }
          },
        );
      },
    );
  }

  Widget _navigatorPage(String route) => Navigator(
        key: Key(route),
        onGenerateRoute: RouterGenerator.generateRoute,
        initialRoute: route,
      );
}
