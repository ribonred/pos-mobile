import 'package:flutter/material.dart';

class AppTextStyle {
  static const TextStyle _textStyle = TextStyle(fontFamily: 'Poppins');

  static TextStyle display =
      _textStyle.copyWith(fontSize: 42, fontWeight: FontWeight.w300);

  static TextStyle header =
      _textStyle.copyWith(fontSize: 34, fontWeight: FontWeight.w600);

  static TextStyle title1 =
      _textStyle.copyWith(fontSize: 28, fontWeight: FontWeight.w600);

  static TextStyle title2 =
      _textStyle.copyWith(fontSize: 24, fontWeight: FontWeight.w400);

  static TextStyle title3 =
      _textStyle.copyWith(fontSize: 22, fontWeight: FontWeight.w400);

  static TextStyle headline =
      _textStyle.copyWith(fontSize: 20, fontWeight: FontWeight.w600);

  static TextStyle body1 =
      _textStyle.copyWith(fontSize: 17, fontWeight: FontWeight.w400);

  static TextStyle body2 =
      _textStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w400);

  static TextStyle caption =
      _textStyle.copyWith(fontSize: 12, fontWeight: FontWeight.w400);
}
