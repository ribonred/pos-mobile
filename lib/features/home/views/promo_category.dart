import 'package:flutter/material.dart';

import '../../../app/widgets/widgets.dart';

class PromoCategories extends StatelessWidget {
  static const String route = '/promo_category_screen';
  const PromoCategories({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Placeholder(
      color: Colors.white,
      child: AppText('Promo Screen'),
    );
  }

  static void open(BuildContext context) => Navigator.pushNamed(context, route);
}
