import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/components.dart';
import '../../controllers/controllers.dart';
import '../../models/models.dart';
import '../../utils/asset_images.dart';
import '../../utils/colors.dart';
import 'menu.dart';

class MenuPage extends GetView<MenuItemController> {
  static const String routeName = '/menu/:menuId';

  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<POSMenuController>(
        builder: (controller) {
          int menuId = Get.arguments?['menuId'] ?? 0;
          List<Menu>? menus = controller.menu;
          Menu? menu = menus?.where((menu) {
            return menu.id == menuId;
          }).firstOrNull;

          bool menuEmpty = menus == null || menus.isEmpty;
          bool menuNotFound = menu == null;

          if (menuEmpty || menuNotFound) {
            return const MenuNotFound();
          }

          return Column(
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(32.0),
                      child: Container(
                        color: AppColors.secondaryOrange,
                        width: double.infinity,
                        height: 300.0,
                        child: Image.asset(
                          AssetImages.foodIcon,
                          scale: 0.5,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).padding.top + 16.0,
                    left: 16.0,
                    child: IconButton.filled(
                      onPressed: () => Get.back(),
                      icon: const Icon(Icons.arrow_back_ios_new),
                    ),
                  ),
                  Positioned(
                    bottom: 0.0,
                    right: 40.0,
                    child: FloatingActionButton(
                      shape: const CircleBorder(),
                      backgroundColor: Colors.white,
                      heroTag: '${menu.merchant}${menu.code}',
                      onPressed: () {},
                      child: const Icon(Icons.favorite_outline),
                    ),
                  )
                ],
              ),
              Expanded(
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: ColorFiltered(
                        colorFilter: const ColorFilter.mode(
                          Colors.grey,
                          BlendMode.srcIn,
                        ),
                        child: Image.asset(
                          AssetImages.foodVector,
                          opacity: const AlwaysStoppedAnimation(.3),
                          colorBlendMode: BlendMode.srcATop,
                        ),
                      ),
                    ),
                    MenuInfo(menu: menu),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class MenuInfo extends StatelessWidget {
  final Menu menu;

  const MenuInfo({
    super.key,
    required this.menu,
  });

  @override
  Widget build(BuildContext context) {
    final MenuItemController controller = Get.find();

    return Padding(
      padding: const EdgeInsets.fromLTRB(32.0, 0.0, 32.0, 32.0),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              menu.name,
              style: Theme.of(context)
                  .textTheme
                  .displayMedium
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          const Spacing.xsmall(),
          const Rating(5.0, size: 18.0),
          const Spacing(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Price(
                menu.price,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              GetBuilder<MenuItemController>(builder: (controller) {
                return Quantity(
                  quantity: controller.qty,
                  onChanged: controller.updateQty,
                );
              }),
            ],
          ),
          const Spacing.small(),
          Expanded(
            child: ListView(
              children: [
                Text(
                  "About",
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const Spacing.small(),
                Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const Spacing(),
                Text(
                  "Extra",
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const Spacing.small(),
                Wrap(
                  spacing: 8.0,
                  // runSpacing: 8.0,
                  children: [
                    AppChip(label: 'cheese', onSelected: () {}),
                    AppChip(label: 'cream', onSelected: () {}),
                    AppChip(
                      selected: true,
                      label: 'chocolate',
                      onSelected: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
          AppButton(
            onPressed: () => controller.addToCart(menu),
            label: 'Add to cart',
          ),
        ],
      ),
    );
  }
}

class MenuNotFound extends StatelessWidget {
  const MenuNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.question_mark_rounded,
              size: 120.0,
              color: Colors.grey,
            ),
            Text(
              'Menu not found',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const Spacing(),
            AppButton(
              onPressed: () => Get.back(),
              label: 'Back',
              outlined: true,
            ),
          ],
        ),
      ),
    );
  }
}
