import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:menu_barcode_apps/app/widgets/widgets.dart';

import '../../../app/constants/app_text_style.dart';
import '../models/models.dart';
import '../widgets/card_menu.dart';
import 'tab/bloc/tab_bloc.dart';

class MenuScreen extends StatelessWidget {
  static const String route = 'menu_screen';
  static void open(BuildContext context) => Navigator.pushNamed(context, route);
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final today = DateFormat("EEEEE").format(DateTime.now());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          'Happy $today!!',
          style: AppTextStyle.title1.copyWith(fontWeight: FontWeight.w600),
        ),
        AppText('What do you want to eat? ', style: AppTextStyle.body1),
        const SizedBox(height: 15),
        const AppTextInput(),
        const SizedBox(height: 45),
        AppText('Categories',
            style: AppTextStyle.headline.copyWith(fontWeight: FontWeight.w600)),
        Expanded(
          child: GridView.count(
              physics: const ScrollPhysics(),
              padding: const EdgeInsets.symmetric(vertical: 25),
              crossAxisCount: 2,
              crossAxisSpacing: 25,
              mainAxisSpacing: 20,
              childAspectRatio: 0.8,
              children: menuCategories(context)
                  .map((e) => CardMenu(
                      label: e.name,
                      iconFile: e.icon,
                      onTap: () =>
                          context.read<TabBloc>().add(OnChangedTab(e.tabPage))))
                  .toList()),
        )
      ],
    );
  }
}
