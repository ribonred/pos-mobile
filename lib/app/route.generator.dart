import 'package:flutter/material.dart';
import 'package:menu_barcode_apps/features/home/home.dart';

import '../features/payment/payments.dart';
import '../features/scan/scan.dart';

class RouterGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case WelcomeScreen.route:
        return MaterialPageRoute(
            builder: (_) => const WelcomeScreen(), settings: settings);
      case ScanScreen.route:
        return MaterialPageRoute(
            builder: (_) => const ScanScreen(), settings: settings);
      case HomeScreen.route:
        return MaterialPageRoute(
            builder: (_) => const HomeScreen(), settings: settings);
      case FoodCategory.route:
        return MaterialPageRoute(
            builder: (_) => const FoodCategory(), settings: settings);
      case SnackCategories.route:
        return MaterialPageRoute(
            builder: (_) => const SnackCategories(), settings: settings);
      case PromoCategories.route:
        return MaterialPageRoute(
            builder: (_) => const PromoCategories(), settings: settings);
      case DrinkCategories.route:
        return MaterialPageRoute(
            builder: (_) => const DrinkCategories(), settings: settings);
      case FavoritePage.route:
        return MaterialPageRoute(
            builder: (_) => const FavoritePage(), settings: settings);
      case CartScreen.route:
        return MaterialPageRoute(
            builder: (_) => const CartScreen(), settings: settings);

      case DetailFood.route:
        return MaterialPageRoute(
            builder: (_) => const DetailFood(), settings: settings);
      case QRViewExample.route:
        return MaterialPageRoute(
            builder: (_) => const QRViewExample(), settings: settings);
      case PaymentPage.route:
        return MaterialPageRoute(
            builder: (_) => const PaymentPage(), settings: settings);
      default:
        return MaterialPageRoute(
            settings: settings,
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text(
                          'No route defined for ${settings.name}')) /*Container()*/,
                ));
    }
  }
}
