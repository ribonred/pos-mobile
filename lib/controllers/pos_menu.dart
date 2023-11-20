import 'package:get/get.dart';

import '../models/pos_responses.dart';
import '../providers/pos_api.dart';

class POSMenuController extends GetxController {
  final POSAPIProvider api = Get.find();

  List<Menu>? menu = [];

  Future getMenu(String merchantId) async {
    menu = await api.getMenu(merchantId);
    update();
  }
}
