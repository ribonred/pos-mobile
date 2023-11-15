import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

import '../models/pos_responses.dart';

class POSAPIProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = dotenv.env['POS_API_URL'];
  }

  Future<QRResponse?> translateQR(String qrData) async {
    Response response = await post(
      '/api/v1/merchant/menu/',
      {'qrdata': qrData},
    );
    if (response.statusCode != 200) {
      Get.log(response.body.toString());
      return null;
    }

    try {
      QRResponse qrResponse = QRResponse.fromJson(response.body);
      return qrResponse;
    } catch (e) {
      Get.log(e.toString());
      return null;
    }
  }

  Future<List<Menu>?> getMenu(String merchantId) async {
    Response response = await get('/api/v1/merchant/menu/$merchantId/');
    if (response.statusCode != 200) {
      Get.log(response.body.toString());
      return null;
    }

    try {
      MenuResponse menuResponse = MenuResponse.fromJson(response.body);
      return menuResponse.menus;
    } catch (e) {
      Get.log(e.toString());
      return null;
    }
  }
}
