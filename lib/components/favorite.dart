import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/models.dart';
import '../pages/pages.dart';
import '../utils/colors.dart';

class Favorite extends StatelessWidget {
  final Menu menu;
  final bool small;

  const Favorite({super.key, required this.menu, this.small = false});

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Colors.white;
    ShapeBorder shape = const CircleBorder();
    String heroTag = '${menu.merchant}${menu.code}';
    Widget child = GetX<HomeController>(
      builder: (controller) {
        bool isFavorite = controller.isFavorite(menu);

        return Icon(
          isFavorite ? Icons.favorite : Icons.favorite_outline,
          color: isFavorite ? AppColors.primaryOrange : Colors.black,
        );
      },
    );

    if (small) {
      return FloatingActionButton.small(
        shape: shape,
        backgroundColor: backgroundColor,
        heroTag: heroTag,
        onPressed: onPressed,
        child: child,
      );
    } else {
      return FloatingActionButton(
        shape: shape,
        backgroundColor: backgroundColor,
        heroTag: heroTag,
        onPressed: onPressed,
        child: child,
      );
    }
  }

  void onPressed() {
    HomeController.to.addOrRemoveFavorite(menu);
  }
}
