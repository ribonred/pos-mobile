import 'package:get/get.dart';

import '../../models/pos_responses.dart';
import '../../providers/pos_api.dart';
import '../../services/database.dart';

class HomeController extends GetxController {
  final DatabaseServices db = Get.find();
  final POSAPIProvider api = Get.find();

  List<Menu>? menu;

  Future getMenu(String qrData) async {
    QRResponse? response = await api.translateQR(qrData);
    if (response == null) {
      return;
    }

    String merchantId = response.data.merchantId;

    menu = await api.getMenu(merchantId);
    update();
  }
}
