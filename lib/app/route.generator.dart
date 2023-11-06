import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menu_barcode_apps/app/views/unknown_route_page.dart';
import 'package:menu_barcode_apps/features/home/home.dart';
import 'package:menu_barcode_apps/features/home/views/menu_screen.dart';
import 'package:menu_barcode_apps/features/home/views/search_screen.dart';

import '../features/payment/payments.dart';
import '../features/scan/scan.dart';

class RouterGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case WelcomeScreen.route:
        return GetPageRoute(routeName: WelcomeScreen.route, settings: settings);
      case ScanScreen.route:
        return GetPageRoute(page: () => const ScanScreen(), settings: settings);
      case HomeScreen.route:
        return GetPageRoute(page: () => const HomeScreen(), settings: settings);
      case MenuScreen.route:
        return GetPageRoute(page: () => const MenuScreen(), settings: settings);
      case SearchScreen.route:
        return GetPageRoute(
            page: () => const SearchScreen(), settings: settings);
      case FoodScreen.route:
        return GetPageRoute(
          page: () => const FoodScreen(),
          settings: settings,
        );
      case SnackScreen.route:
        return GetPageRoute(
            page: () => const SnackScreen(), settings: settings);
      case PromoScreen.route:
        return GetPageRoute(
            page: () => const PromoScreen(), settings: settings);
      case DrinkScreen.route:
        return GetPageRoute(
            page: () => const DrinkScreen(), settings: settings);
      case FavoriteScreen.route:
        return GetPageRoute(
            page: () => const FavoriteScreen(), settings: settings);
      case CartScreen.route:
        return GetPageRoute(page: () => const CartScreen(), settings: settings);
      case FoodDetailsScreen.route:
        return GetPageRoute(
            page: () => const FoodDetailsScreen(), settings: settings);
      case QRViewExample.route:
        return GetPageRoute(page: () => QRViewExample(), settings: settings);
      case PaymentScreen.route:
        return GetPageRoute(
            page: () => const PaymentScreen(), settings: settings);
      default:
        return GetPageRoute(
            settings: settings,
            page: () => UnknownRoutePage(namePage: settings.name as String));

      // *Route with material page route
      // case WelcomeScreen.route:
      //   return MaterialPageRoute(
      //       builder: (_) => const WelcomeScreen(), settings: settings);
      // case ScanScreen.route:
      //   return MaterialPageRoute(
      //       builder: (_) => const ScanScreen(), settings: settings);
      // case HomeScreen.route:
      //   return MaterialPageRoute(
      //       builder: (_) => const HomeScreen(), settings: settings);
      // case MenuScreen.route:
      //   return MaterialPageRoute(
      //       builder: (_) => const MenuScreen(), settings: settings);
      // case SearchScreen.route:
      //   return MaterialPageRoute(
      //       builder: (_) => const SearchScreen(), settings: settings);
      // case FoodScreen.route:
      //   return MaterialPageRoute(
      //       builder: (_) => const FoodScreen(), settings: settings);
      // case SnackCategories.route:
      //   return MaterialPageRoute(
      //       builder: (_) => const SnackCategories(), settings: settings);
      // case PromoScreen.route:
      //   return MaterialPageRoute(
      //       builder: (_) => const PromoScreen(), settings: settings);
      // case DrinkCategories.route:
      //   return MaterialPageRoute(
      //       builder: (_) => const DrinkCategories(), settings: settings);
      // case FavoriteScreen.route:
      //   return MaterialPageRoute(
      //       builder: (_) => const FavoriteScreen(), settings: settings);
      // case CartScreen.route:
      //   return MaterialPageRoute(
      //       builder: (_) => const CartScreen(), settings: settings);
      // case DetailFood.route:
      //   return MaterialPageRoute(
      //       builder: (_) => const DetailFood(), settings: settings);
      // case QRViewExample.route:
      //   return MaterialPageRoute(
      //       builder: (_) => const QRViewExample(), settings: settings);
      // case PaymentPage.route:
      //   return MaterialPageRoute(
      //       builder: (_) => const PaymentPage(), settings: settings);

      // default:
      //   return MaterialPageRoute(
      //       settings: settings,
      //       builder: (_) =>
      //           UnknownRoutePage(namePage: settings.name as String));
    }
  }
}
