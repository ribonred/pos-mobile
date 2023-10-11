import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:menu_barcode_apps/app/constants/icons.dart';
import 'package:menu_barcode_apps/features/home/home.dart';

import '../../../app/constants/app_colors.dart';
import '../../../app/constants/app_text_style.dart';
import '../../../app/widgets/widgets.dart';
import '../models/menu_category_model.dart';
import '../models/widgets/card_menu.dart';

class HomeScreen extends StatelessWidget {
  static const String route = 'home_screen';
  static void open(BuildContext context) => Navigator.pushNamed(context, route);
  static void openAndRemoveAllRoute(BuildContext context) =>
      Navigator.pushNamedAndRemoveUntil(
          context, route, (Route<dynamic> route) => false);
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final today = DateFormat("EEEEE").format(DateTime.now());
    return Scaffold(
      backgroundColor: AppColors.primaryOrange,
      body: Container(
        padding: const EdgeInsets.fromLTRB(34, 0, 34, 0),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30))),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                'Happy $today!!',
                style:
                    AppTextStyle.title1.copyWith(fontWeight: FontWeight.w600),
              ),
              AppText('What do you want to eat? ', style: AppTextStyle.body1),
              const SizedBox(height: 15),
              const AppTextInput(),
              const SizedBox(height: 45),
              AppText('Categories',
                  style: AppTextStyle.headline
                      .copyWith(fontWeight: FontWeight.w600)),
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
                            label: e.name, iconFile: e.icon, onTap: e.action))
                        .toList()),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        color: AppColors.primaryOrange,
        notchMargin: 20,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              child: const Icon(
                Icons.home_outlined,
                color: Colors.white,
                size: 30,
              ),
            ),
            GestureDetector(
              child: getSvgImage(AppIcons.search,
                  colorFilter:
                      const ColorFilter.mode(Colors.white, BlendMode.clear)),
            ),
            const Icon(
              Icons.favorite_border,
              color: Colors.white,
              size: 30,
            ),
            GestureDetector(
              onTap: () => CartScreen.open(context),
              child: const Icon(
                Icons.trolley,
                color: Colors.white,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
