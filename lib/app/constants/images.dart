import 'package:flutter/material.dart';

class AppImages {
  static const bottomHomeBg = 'assets/bottom_home_background.png';
  static const beefOnPlate = 'assets/beef_on_plate.png';
  static const qrCode = 'assets/scan/barcode3.png';
  static const foodIcon = 'assets/images/food_icon.png';
  static const favIcon = 'assets/images/fav_icon.png';
  static const drinkIcon = 'assets/images/drink_icon.png';
  static const snackIcon = 'assets/images/snack_icon.png';
}

Image getPngImage(String src,
        {double? height,
        double? width,
        BoxFit? fit,
        Color? color,
        BlendMode? blendMode}) =>
    Image.asset(
      src,
      color: color,
      height: height,
      width: width,
      fit: fit,
      colorBlendMode: blendMode,
    );
