import 'package:get/get.dart';

import '../../features/home/home.dart';
import '../../features/home/views/search_screen.dart';
import '../../features/payment/payments.dart';
import '../../features/scan/binding/qr_binding.dart';
import '../../features/scan/scan.dart';

final List<GetPage> appPages = [
  GetPage(name: WelcomeScreen.route, page: () => const WelcomeScreen()),
  GetPage(
    name: ScanScreen.route,
    page: () => ScanScreen(),
    binding: QRBinding(),
  ),
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
