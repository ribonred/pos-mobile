import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/widgets/widgets.dart';
import '../../../core/widgets/menu_card.dart';
import '../home.dart';
import 'tab/bottom_tab_controller.dart';

class FoodScreen extends StatelessWidget {
  static const String route = '/food_category_screen';
  const FoodScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BottomTabController c = Get.find();

    return GetBuilder<BottomTabController>(
      builder: (_) {
        return WillPopScope(
          onWillPop: () async {
            c.backToMenu();
            return false;
          },
          child: MainPageContainer(
            child: Column(
              children: [
                AppHeader(
                  title: 'Food Screen',
                  onTapBack: () => c.backToMenu(),
                ),
                const AppTextInput(
                  margin: EdgeInsets.fromLTRB(34, 20, 34, 20),
                ),
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 43),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 25,
                      mainAxisSpacing: 20,
                      mainAxisExtent: 200,
                    ),
                    itemCount: 20,
                    itemBuilder: (context, index) => MenuCard(
                      rate: index,
                      onTap: () => Get.toNamed(FoodDetailsScreen.route,
                          arguments: index),
                    ),
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
