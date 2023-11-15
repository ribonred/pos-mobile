import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/pos_responses.dart';
import '../pages/pages.dart';
import '../providers/pos_api.dart';

class POSMenuController extends GetxController {
  final POSAPIProvider api = Get.find();

  List<Menu>? menu = [
    Menu(
      id: 1,
      name: 'Mix noodle',
      price: '45000',
      priceDisplay: 'Rp 45.000',
      basePriceDisplay: 'Rp 45.000',
      currency: 'IDR',
      inStock: true,
      code: 'MIX_NOODLE',
      merchant: 'sljkdahkjs',
      category: [],
    ),
    Menu(
      id: 2,
      name: 'Beef platter',
      price: '110000',
      priceDisplay: 'Rp 110.000',
      basePriceDisplay: 'Rp 110.000',
      currency: 'IDR',
      inStock: true,
      code: 'BEEF_PLATTER',
      merchant: 'sljkdahkjs',
      category: [],
    ),
    Menu(
      id: 3,
      name: 'Salmon Pizza',
      price: '120000',
      priceDisplay: 'Rp 120.000',
      basePriceDisplay: 'Rp 120.000',
      currency: 'IDR',
      inStock: true,
      code: 'SALMON_PIZZA',
      merchant: 'sljkdahkjs',
      category: [],
    )
  ];

  Future getMenu(String qrData) async {
    QRResponse? response = await api.translateQR(qrData);
    if (response == null) {
      Get.snackbar(
        'Error',
        'Cannot find the merchant',
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
      Get.offNamed(WelcomePage.routeName);
    } else {
      String merchantId = response.data.merchantId;

      menu = await api.getMenu(merchantId);
      update();
    }
  }
}
