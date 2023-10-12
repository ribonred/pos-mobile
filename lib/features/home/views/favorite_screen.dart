import 'package:flutter/material.dart';
import 'package:menu_barcode_apps/app/widgets/widgets.dart';

class FavoriteScreen extends StatelessWidget {
  static const String route = '/favorite_screen';
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        AppText('Favorite Screen'),
        Placeholder(),
      ],
    );
  }

  static void open(BuildContext context) => Navigator.pushNamed(context, route);
}
