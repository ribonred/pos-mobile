import 'package:get/get.dart';

import '../../providers/pos_api.dart';
import '../../services/database.dart';

class HomeController extends GetxController {
  final DatabaseServices db = Get.find();
  final POSAPIProvider api = Get.find();

  final RxInt currentIndex = 0.obs;
}
