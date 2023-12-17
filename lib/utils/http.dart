import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:platform_device_id_v3/platform_device_id.dart';

import '../pages/pages.dart';
import '../services/services.dart';

Future<Request> sessionIdInterceptor(Request<dynamic> request) async {
  final DatabaseService db = Get.find();

  String sessionId = db.session.get('sessionId')!;

  request.headers['X-Session-Id'] = sessionId;
  return request;
}

Future<Request> deviceInfoInterceptor(Request<dynamic> request) async {
  String? deviceId = await PlatformDeviceId.getDeviceId ?? "unknownid";
  String osdevice = "unknown";
  if (kIsWeb) {
    osdevice = "web";
  } else if (GetPlatform.isAndroid) {
    osdevice = "android";
  } else if (GetPlatform.isIOS) {
    osdevice = "ios";
  }

  request.headers['X-Device-Info'] = "$deviceId;$osdevice;";
  return request;
}

extension ResponseHandler on Response {
  void handleResponse({
    required void Function(dynamic result) onSuccess,
    String errorTitle = 'Error',
    String errorMessage = 'Something went wrong',
    bool handle401 = true,
  }) {
    final DatabaseService db = Get.find();
    final NotificationService notification = Get.find();

    if (body == null) {
      notification.showErrorSnackbar('No response');
      return;
    }

    if (hasError) {
      switch (statusCode) {
        case 401:
          if (!handle401) continue skip401;

          notification.showErrorSnackbar(
            'Please sign in again',
            title: 'Expired session',
          );

          db.clearSession().then((_) {
            return Get.offAllNamed(WelcomePage.routeName);
          });

          break;
        case 403:
          notification.showErrorSnackbar(
            'You are not authorized to perform this action',
            title: 'Forbidden',
          );
          break;
        skip401:
        default:
          notification.showErrorSnackbar(errorMessage, title: errorTitle);
      }

      // return early for error
      return;
    }

    // on success
    onSuccess(body);
  }
}
