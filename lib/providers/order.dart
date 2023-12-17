import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

import '../models/models.dart';
import '../utils/utils.dart';

class OrdersProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = dotenv.env['POS_API_URL'];
    httpClient.addRequestModifier(deviceInfoInterceptor);
    httpClient.addRequestModifier(sessionIdInterceptor);
    // httpClient.addResponseModifier(debugInterceptor);
  }

  Future<bool> createOrder(Order order) async {
    Response response = await post('/api/v1/orders/', order.toJson());
    return response.statusCode == 201;
  }

  Future<bool> updateOrder(int id, int count) async {
    Response response = await patch('/api/v1/orders/$id/', {'quantity': count});
    return response.statusCode == 200;
  }

  Future<bool> deleteOrder(int id) async {
    Response response = await delete('/api/v1/orders/$id/');
    return response.statusCode == 204;
  }

  Future<OrderResponse?> getOrders() async {
    Response response = await get('/api/v1/orders/');

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
}
