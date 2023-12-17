import 'package:get/get.dart';

import '../models/models.dart';
import '../pages/menu/menu.dart';
import '../services/database.dart';
import '../utils/asset_images.dart';

class POSController extends GetxController {
  final DatabaseService db = Get.find();
  final POSMenuProvider api = Get.find();

  List<Menu>? menu;
  List<Map> menuCategories = [
    {'name': 'Food', 'icon': AssetImages.foodIcon, 'category': 'food'},
    {'name': 'Promo', 'icon': AssetImages.favIcon, 'category': 'promo'},
    {'name': 'Snack', 'icon': AssetImages.snackIcon, 'category': 'snack'},
    {'name': 'Drinks', 'icon': AssetImages.drinkIcon, 'category': 'drinks'},
  ];

  Future getMenu() async {
    menu = null;
    update();

    String? merchantId = db.session.get('merchantId', defaultValue: null);

    if (merchantId != null || merchantId != '') {
      menu = await api.getMenu(merchantId!) ?? [];
      update();
    }
  }
}
