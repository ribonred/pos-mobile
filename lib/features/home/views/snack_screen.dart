import 'package:flutter/material.dart';
import 'package:menu_barcode_apps/features/home/views/tab/bottom_tab_controller.dart';
import 'package:menu_barcode_apps/features/home/widgets/main_page_container.dart';

import '../../../app/widgets/widgets.dart';

class SnackScreen extends StatelessWidget {
  static const String route = '/snack_screen';
  const SnackScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainPageContainer(
      child: Column(
        children: [
          AppHeader(
            title: 'Snack Screen',
            onTapBack: () => BottomTabController.to.backToMenu(),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 34),
              physics: const ScrollPhysics(),
              children: const [
                Placeholder(),
                Placeholder(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static void open(BuildContext context) => Navigator.pushNamed(context, route);
}
