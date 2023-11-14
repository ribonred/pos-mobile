import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class HomePage extends GetView<HomeController> {
  static const String routeName = '/';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomeController>(initState: (state) {
        String? qrData = controller.db.settings.get('qrData');
        if (qrData != null) {
          controller.getMenu(qrData);
        }
      }, builder: (context) {
        return Center(
          child: Text(controller.menu.toString()),
        );
      }),
    );
  }
}
