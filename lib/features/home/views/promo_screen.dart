import 'package:flutter/material.dart';
import 'package:menu_barcode_apps/features/home/views/tab/bottom_tab_controller.dart';
import 'package:menu_barcode_apps/features/home/widgets/main_page_container.dart';

import '../../../app/widgets/widgets.dart';

class PromoScreen extends StatelessWidget {
  static const String route = '/promo_category_screen';
  const PromoScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MainPageContainer(
      child: Column(
        children: [
          AppHeader(
            title: 'Promo Screen',
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
