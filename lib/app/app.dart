import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../features/home/home.dart';
import 'route.generator.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouterGenerator.generateRoute,
      home: const HomeScreen(),
    );
  }
}
