import 'package:get/get.dart';

import '../pages.dart';

class CashierConfirmationController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(
      const Duration(seconds: 3),
      () => Get.offAllNamed(
        SuccessPage.routeName,
        predicate: (route) => route.settings.name == HomePage.routeName,
      ),
    );
  }
}
