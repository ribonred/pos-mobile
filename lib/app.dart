import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'pages/pages.dart';
import 'services/database.dart';
import 'utils/colors.dart';

class POSApp extends StatefulWidget {
  const POSApp({super.key});

  @override
  State<POSApp> createState() => _POSAppState();
}

class _POSAppState extends State<POSApp> with WidgetsBindingObserver {
  final DatabaseServices db = Get.find();

  static const inactivityTimeout = Duration(minutes: 10);
  Timer? sessionEndTimer;

  void routingCallback(Routing? routing) {
    if (routing?.current == HomePage.routeName && sessionEndTimer == null) {
      WidgetsBinding.instance.addObserver(this);
    }
  }

  void keepSession(bool isAppVisible) {
    sessionEndTimer?.cancel();

    if (isAppVisible) {
      // If the app is visible, reset the timer
      sessionEndTimer = null;
    } else {
      // If the app is not visible, start the timer
      sessionEndTimer = Timer(inactivityTimeout, () {
        db.session.delete('sessionId');
        db.session.delete('merchantId');
        Get.offAllNamed(WelcomePage.routeName);
      });
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    switch (state) {
      case AppLifecycleState.resumed:
        keepSession(true);
        break;
      case AppLifecycleState.hidden:
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
        keepSession(false);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return GetMaterialApp(
      title: 'POS App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryOrange),
        fontFamily: 'Poppins',
        useMaterial3: true,
      ),
      routingCallback: routingCallback,
      getPages: appPages,
      initialRoute: WelcomePage.routeName,
    );
  }
}
