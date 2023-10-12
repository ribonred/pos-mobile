import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/widgets/widgets.dart';
import 'tab/bloc/tab_bloc.dart';

class PromoCategories extends StatelessWidget {
  static const String route = '/promo_category_screen';
  const PromoCategories({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppHeader(
          title: 'Promo Screen',
          onTapBack: () => context.read<TabBloc>().add(BackToMainMenu()),
        ),
        // AppText('Drink Screen'),
        const Placeholder(),
      ],
    );
  }

  static void open(BuildContext context) => Navigator.pushNamed(context, route);
}
