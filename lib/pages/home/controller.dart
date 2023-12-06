import 'package:get/get.dart';

import '../../controllers/controllers.dart';
import '../../services/database.dart';
import '../pages.dart';

class HomeController extends GetxController {
  final DatabaseServices db = Get.find();
  final POSMenuController menuController = Get.find();

  final RxInt currentIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    menuController.getMenu();
  }

  Future<void> clearSession() async {
    await db.clearSession().then((_) => Get.offAllNamed(WelcomePage.routeName));
  }
}
