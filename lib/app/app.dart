import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'routes/app_route.dart';
import '../features/home/home.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return GetMaterialApp(
      title: 'POS',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Poppins'),
      debugShowCheckedModeBanner: false,
      initialRoute: WelcomeScreen.route,
      getPages: appPages,
    );
  }
}
