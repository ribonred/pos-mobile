import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../app/constants/app_text_style.dart';
import '../../../app/widgets/widgets.dart';
import '../domain/models/models.dart';
import '../widgets/category_card.dart';
import '../widgets/main_page_container.dart';
import 'tab/bottom_tab_controller.dart';

class MenuScreen extends StatelessWidget {
  static const String route = 'menu_screen';
  const MenuScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final today = DateFormat("EEEEE").format(DateTime.now());

    return MainPageContainer(
      padding: const EdgeInsets.all(24.0),
      child: SafeArea(
        child: Column(
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
            AppText(
              'Categories',
              style: AppTextStyle.headline.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            Expanded(
              child: GridView.count(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                crossAxisCount: 2,
                crossAxisSpacing: 24.0,
                mainAxisSpacing: 16.0,
                children: menuCategories(context)
                    .map(
                      (e) => CategoryCard(
                        label: e.name,
                        iconFile: e.icon,
                        onTap: () =>
                            BottomTabController.to.onChangedTab(e.tabPage),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static void open(BuildContext context) => Navigator.pushNamed(context, route);
}
