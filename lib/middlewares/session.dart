import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/pages.dart';
import '../services/database.dart';

class SessionMiddleware extends GetMiddleware {
  final DatabaseServices db = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    return db.settings.get('qrData') == null
        ? const RouteSettings(name: WelcomePage.routeName)
        : null;
  }
}
