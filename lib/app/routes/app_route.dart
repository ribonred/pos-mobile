import 'package:get/get.dart';
import 'package:menu_barcode_apps/features/home/home.dart';
import 'package:menu_barcode_apps/features/home/views/search_screen.dart';
import 'package:menu_barcode_apps/features/payment/payments.dart';
import 'package:menu_barcode_apps/features/scan/scan.dart';

import '../../features/scan/binding/qr_binding.dart';

final List<GetPage> appPages = [
  GetPage(name: WelcomeScreen.route, page: () => const WelcomeScreen()),
  GetPage(name: ScanScreen.route, page: () => const ScanScreen()),
  GetPage(name: HomeScreen.route, page: () => const HomeScreen()),
  GetPage(name: SearchScreen.route, page: () => const SearchScreen()),
  GetPage(name: FavoriteScreen.route, page: () => const FavoriteScreen()),
  GetPage(name: FoodScreen.route, page: () => const FoodScreen()),
  GetPage(name: FoodDetailsScreen.route, page: () => const FoodDetailsScreen()),
  GetPage(name: DrinkScreen.route, page: () => const DrinkScreen()),
  GetPage(name: PromoScreen.route, page: () => const PromoScreen()),
  GetPage(name: SnackScreen.route, page: () => const SnackScreen()),
  GetPage(
      name: QRViewExample.route,
      page: () => QRViewExample(),
      binding: QRBinding()),
  GetPage(name: PaymentScreen.route, page: () => const PaymentScreen()),
  GetPage(name: CartScreen.route, page: () => const CartScreen()),
];
