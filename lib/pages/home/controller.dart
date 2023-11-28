import 'package:get/get.dart';

import '../../controllers/controllers.dart';
import '../../services/database.dart';

class HomeController extends GetxController {
  final DatabaseServices db = Get.find();
  final POSMenuController menuController = Get.find();

  final RxInt currentIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();

    String? merchantId = db.session.get('merchantId');
    if (merchantId != null || merchantId != '') {
      menuController.getMenu(merchantId!);
    }
  }
}
