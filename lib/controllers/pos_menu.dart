import 'package:get/get.dart';

import '../models/models.dart';
import '../providers/pos_api.dart';
import '../services/database.dart';

class POSMenuController extends GetxController {
  final DatabaseServices db = Get.find();
  final POSAPIProvider api = Get.find();

  List<Menu>? menu = [];

  Future getMenu() async {
    String? merchantId = db.session.get('merchantId', defaultValue: null);
    if (merchantId != null || merchantId != '') {
      menu = await api.getMenu(merchantId!);
      update();
    }
  }
}
