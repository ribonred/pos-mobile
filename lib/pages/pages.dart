import 'package:get/get.dart';

import '../middlewares/middlewares.dart';
import 'category/category.dart';
import 'home/home.dart';
import 'qr_scan/qr_scan.dart';
import 'welcome/welcome.dart';

export 'category/category.dart';
export 'home/home.dart';
export 'qr_scan/qr_scan.dart';
export 'welcome/welcome.dart';

List<GetPage> appPages = [
  GetPage(
    name: WelcomePage.routeName,
    page: () => const WelcomePage(),
  ),
  GetPage(
    name: QRScanPage.routeName,
    page: () => const QRScanPage(),
    binding: QRScanBinding(),
  ),
  GetPage(
    name: HomePage.routeName,
    page: () => const HomePage(),
    binding: HomeBinding(),
    middlewares: [SessionMiddleware()],
  ),
  GetPage(
    name: CategoryPage.routeName,
    page: () => const CategoryPage(),
  )
];
