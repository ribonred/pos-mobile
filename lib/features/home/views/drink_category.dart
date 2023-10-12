import 'package:flutter/material.dart';
import 'package:menu_barcode_apps/app/widgets/widgets.dart';

class DrinkCategories extends StatelessWidget {
  static const String route = '/drink_category_screen';
  const DrinkCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder(
      child: AppText('Drink Menu'),
    );
  }

  static void open(BuildContext context) => Navigator.pushNamed(context, route);
}
