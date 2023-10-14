import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppIcons {
  static const search = 'assets/icons/search.svg';
  static const home = 'assets/icons/home.svg';
  static const love = 'assets/icons/love.svg';
  static const cart = 'assets/icons/cart.svg';
}

Widget getSvgImage(String src,
        {Color color = Colors.black,
        double? height,
        double? width,
        BoxFit fit = BoxFit.scaleDown}) =>
    SvgPicture.asset(
      src,
      height: height,
      width: width,
      fit: fit,
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
    );
