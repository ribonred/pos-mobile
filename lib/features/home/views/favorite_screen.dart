import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menu_barcode_apps/app/widgets/widgets.dart';
import 'package:menu_barcode_apps/features/home/views/tab/bottom_tab_controller.dart';
import 'package:menu_barcode_apps/features/home/widgets/main_page_container.dart';

import '../../../app/constants/app_text_style.dart';

class FavoriteScreen extends StatelessWidget {
  static const String route = '/favorite_screen';
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        int pageId = BottomTabController().indexTab.value;
        Get.back(id: pageId);
        return false;
      },
      child: MainPageContainer(
        padding: const EdgeInsets.symmetric(horizontal: 34),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              'Favorite Screen',
              style: AppTextStyle.title1,
            ),
            const SizedBox(height: 10),
            Expanded(
                child: ListView(
              children: const [
                Placeholder(),
                Placeholder(),
                Placeholder(),
              ],
            )),
          ],
        ),
      ),
    );
  }

  static void open(BuildContext context) => Navigator.pushNamed(context, route);
}
