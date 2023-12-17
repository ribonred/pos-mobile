import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/pages.dart';
import '../services/database.dart';

class SessionMiddleware extends GetMiddleware {
  final DatabaseService db = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    String? sessionId = db.session.get('sessionId');
    String? merchantId = db.session.get('merchantId');

    bool hasSessionId = sessionId != null && sessionId != '';
    bool hasMerchantId = merchantId != null && merchantId != '';

    return hasSessionId && hasMerchantId
        ? const RouteSettings(name: HomePage.routeName)
        : null;
  }
}
