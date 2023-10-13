import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menu_barcode_apps/features/home/views/tab/bottom_tab_controller.dart';
import 'package:menu_barcode_apps/features/home/widgets/main_page_container.dart';

import '../../../app/widgets/widgets.dart';

class FoodScreen extends StatelessWidget {
  static const String route = '/food_category_screen';
  const FoodScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomTabController>(
      builder: (_) {
        return WillPopScope(
          onWillPop: () async {
            BottomTabController.to.backToMenu();
            return false;
          },
          child: MainPageContainer(
            child: Column(
              children: [
                AppHeader(
                    title: 'Food Screen',
                    onTapBack: () => BottomTabController.to.backToMenu()),
                const AppTextInput(
                  margin: EdgeInsets.fromLTRB(34, 20, 34, 20),
                ),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 34),
                    physics: const ScrollPhysics(),
                    children: const [
                      Placeholder(),
                      Placeholder(),
                      Placeholder(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static void open(BuildContext context) => Navigator.pushNamed(context, route);
}
