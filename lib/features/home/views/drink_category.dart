import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:menu_barcode_apps/app/widgets/widgets.dart';

import 'tab/bloc/tab_bloc.dart';

class DrinkCategories extends StatelessWidget {
  static const String route = '/drink_category_screen';
  const DrinkCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppHeader(
          title: 'Drink Screen',
          onTapBack: () => context.read<TabBloc>().add(BackToMainMenu()),
        ),
        // AppText('Drink Screen'),
        const Placeholder(),
      ],
    );
  }

  static void open(BuildContext context) => Navigator.pushNamed(context, route);
}
