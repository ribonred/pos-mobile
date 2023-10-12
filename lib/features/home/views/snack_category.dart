import 'package:flutter/material.dart';

import '../../../app/widgets/widgets.dart';

class SnackCategories extends StatelessWidget {
  static const String route = '/snack_category_screen';
  const SnackCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder(
      child: AppText('Snack Screen'),
    );
  }

  static void open(BuildContext context) => Navigator.pushNamed(context, route);
}
