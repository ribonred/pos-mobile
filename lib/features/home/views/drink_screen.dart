import 'package:flutter/material.dart';
import 'package:menu_barcode_apps/app/widgets/widgets.dart';
import 'package:menu_barcode_apps/features/home/views/tab/bottom_tab_controller.dart';
import 'package:menu_barcode_apps/features/home/widgets/main_page_container.dart';

class DrinkScreen extends StatelessWidget {
  static const String route = '/drink_category_screen';
  const DrinkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainPageContainer(
      child: Column(
        children: [
          AppHeader(
            title: 'Drink Screen',
            onTapBack: () => BottomTabController.to.backToMenu(),
          ),
          Expanded(
              child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 34),
            children: const [
              Placeholder(),
              Placeholder(),
            ],
          )),
        ],
      ),
    );
  }

  static void open(BuildContext context) => Navigator.pushNamed(context, route);
}
