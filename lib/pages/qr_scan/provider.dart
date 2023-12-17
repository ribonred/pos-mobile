import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

import '../../utils/utils.dart';
import 'models/models.dart';

class QRScanProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = dotenv.env['POS_API_URL'];
    httpClient.addRequestModifier(deviceInfoInterceptor);
  }

  Future<QRResponse?> translateQR(String qrData) async {
    Response response = await post(
      '/api/v1/merchant/menu/',
      {'qrdata': qrData},
    );

    if (kDebugMode) print(response.body.toString());

    if (response.statusCode != 201) {
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
}
