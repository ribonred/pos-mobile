import 'package:flutter/material.dart';

class AppImages {
  static const bottomHomeBg = 'assets/bottom_home_background.png';
  static const beefOnPlate = 'assets/beef_on_plate.png';
  static const qrCode = 'assets/scan/barcode3.png';
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
