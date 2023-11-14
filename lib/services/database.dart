import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DatabaseServices extends GetxService {
  static DatabaseServices get to => Get.find();

  Box get settings => Hive.box('settings');

  Future<DatabaseServices> init() async {
    await Hive.initFlutter();
    await Hive.openBox('settings');

    return this;
  }
}
