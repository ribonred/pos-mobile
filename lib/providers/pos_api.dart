import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

import '../models/models.dart';
import '../utils/utils.dart';

class POSAPIProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = dotenv.env['POS_API_URL'];
    httpClient.addRequestModifier(deviceInfoInterceptor);
  }

  Future<bool> createOrder(Order order, String sessionId) async {
    Response response = await post(
      '/api/v1/orders/',
      order.toJson(),
      headers: {'X-Order-Session': sessionId},
    );

    if (kDebugMode) print(response.body.toString());

    if (response.statusCode != 201) {
      return false;
    }

    return true;
  }

  Future<bool> deleteOrder(int id, String sessionId) async {
    Response response = await delete(
      '/api/v1/orders/$id/',
      headers: {'X-Order-Session': sessionId},
    );

    if (kDebugMode) print(response.body.toString());

    if (response.statusCode != 204) {
      return false;
    }

    return true;
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

  Future<OrderResponse?> getOrders(String sessionId) async {
    Response response = await get(
      '/api/v1/orders/',
      headers: {'X-Order-Session': sessionId},
    );

    if (kDebugMode) print(response.body.toString());

    if (response.statusCode != 200) {
      return null;
    }

    try {
      OrderResponse orderResponse = OrderResponse.fromJson(response.body);
      return orderResponse;
    } catch (e) {
      if (kDebugMode) print(e.toString());
      return null;
    }
  }

  Future<bool> updateOrder(int id, int count, String sessionId) async {
    Response response = await patch(
      '/api/v1/orders/$id/',
      {'quantity': count},
      headers: {'X-Order-Session': sessionId},
    );

    if (kDebugMode) print(response.body.toString());

    if (response.statusCode != 200) {
      Get.log(response.body.toString());
      return false;
    }

    return true;
  }
}
