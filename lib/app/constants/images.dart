import 'package:flutter/material.dart';

class AppImages {
  static const foodVector = 'assets/images/food_vector.png';
  static const beefSteak = 'assets/images/beef_steak.png';
  static const barcode = 'assets/images/barcode.png';
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
