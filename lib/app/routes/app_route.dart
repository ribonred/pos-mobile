import 'package:get/get.dart';
import 'package:menu_barcode_apps/features/home/home.dart';
import 'package:menu_barcode_apps/features/home/views/search_screen.dart';
import 'package:menu_barcode_apps/features/scan/scan.dart';

List<GetPage> appRoute = [
  GetPage(name: WelcomeScreen.route, page: () => const WelcomeScreen()),
  GetPage(name: ScanScreen.route, page: () => const ScanScreen()),
  GetPage(name: HomeScreen.route, page: () => const HomeScreen()),
  GetPage(name: SearchScreen.route, page: () => const SearchScreen()),
];
