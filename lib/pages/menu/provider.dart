import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

import '../../models/models.dart';
import '../../utils/utils.dart';

class POSMenuProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = dotenv.env['POS_API_URL'];
    httpClient.addRequestModifier(deviceInfoInterceptor);
  }

  Future<List<Menu>?> getMenu(String merchantId) async {
    Response response = await get('/api/v1/merchant/menu/$merchantId/');

    if (kDebugMode) print(response.body.toString());

    if (response.statusCode != 200) {
      return null;
    }

    try {
      MenuResponse menuResponse = MenuResponse.fromJson(response.body);
      return menuResponse.results;
    } catch (e) {
      Get.log(e.toString());
      return null;
    }
  }
}
