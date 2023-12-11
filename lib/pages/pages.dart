import 'package:get/get.dart';

import '../middlewares/middlewares.dart';
import 'cart/cart.dart';
import 'cashier_confirmation/cashier_confirmation.dart';
import 'category/category.dart';
import 'home/home.dart';
import 'menu/menu.dart';
import 'qr_scan/qr_scan.dart';
import 'welcome/welcome.dart';

export 'cart/cart.dart';
export 'cashier_confirmation/cashier_confirmation.dart';
export 'category/category.dart';
export 'home/home.dart';
export 'menu/menu.dart';
export 'qr_scan/qr_scan.dart';
export 'welcome/welcome.dart';

List<GetPage> appPages = [
  GetPage(
    name: WelcomePage.routeName,
    page: () => const WelcomePage(),
    middlewares: [SessionMiddleware()],
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
  ),
  GetPage(
    name: CategoryPage.routeName,
    page: () => const CategoryPage(),
  ),
  GetPage(
    name: MenuPage.routeName,
    page: () => const MenuPage(),
    binding: MenuBinding(),
  ),
  GetPage(
    name: CarouselPage.routeName,
    page: () => const CarouselPage(),
    binding: MenuBinding(),
  ),
  GetPage(
    name: CartPage.routeName,
    page: () => const CartPage(),
    binding: CartBinding(),
  ),
  GetPage(
    name: PaymentPage.routeName,
    page: () => const PaymentPage(),
    binding: CartBinding(),
  ),
  GetPage(
    name: CashierConfirmationPage.routeName,
    page: () => const CashierConfirmationPage(),
    binding: CashierConfirmationBinding(),
  ),
  GetPage(
    name: SuccessPage.routeName,
    page: () => const SuccessPage(),
  ),
];
