import 'package:get/get.dart';

import '../../controllers/controllers.dart';
import '../../models/models.dart';
import '../../services/database.dart';
import '../pages.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  final DatabaseServices db = Get.find();
  final POSMenuController menuController = Get.find();

  final RxInt currentIndex = 0.obs;
  final RxList<Menu> favorites = <Menu>[].obs;

  @override
  void onInit() {
    super.onInit();
    menuController.getMenu();
  }

  Future<void> clearSession() async {
    await db.clearSession().then((_) => Get.offAllNamed(WelcomePage.routeName));
  }

  bool isFavorite(Menu menu) {
    return favorites.contains(menu);
  }

  void addOrRemoveFavorite(Menu menu) {
    if (isFavorite(menu)) {
      favorites.remove(menu);
    } else {
      favorites.add(menu);
    }
  }
}
