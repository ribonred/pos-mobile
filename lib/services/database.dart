import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DatabaseService extends GetxService {
  static DatabaseService get to => Get.find();

  Box get settings => Hive.box('settings');
  Box get session => Hive.box('session');

  Future<DatabaseService> init() async {
    await Hive.initFlutter();
    await Hive.openBox('settings');
    await Hive.openBox('session');

    return this;
  }

  Future<void> clearSession() async {
    await session.clear();
  }
}
