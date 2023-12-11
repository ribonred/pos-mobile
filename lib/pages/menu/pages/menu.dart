import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/components.dart';
import '../../../controllers/controllers.dart';
import '../../../models/models.dart';
import '../../../utils/asset_images.dart';
import '../../../utils/colors.dart';
import '../menu.dart';

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
            return const ItemNotFoundBox(
              message: 'Item not found',
              showBackButton: true,
            );
          }

          return Stack(
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
              Column(
                children: [
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        Stack(
                          children: [
                            _buildHeaderImage(menu),
                            Positioned(
                              bottom: 0.0,
                              right: 40.0,
                              child: Favorite(menu: menu),
                            )
                          ],
                        ),
                        MenuInfo(menu: menu),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: AppButton(
                      onPressed: () => MenuItemController.to.addToCart(menu),
                      label: 'Add to cart',
                    ),
                  ),
                ],
              ),
              Positioned(
                top: MediaQuery.of(context).padding.top + 16.0,
                left: 16.0,
                child: IconButton.filled(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Colors.black38,
                    ),
                  ),
                  onPressed: () => Get.back(),
                  icon: const Icon(Icons.arrow_back_ios_new),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildHeaderImage(Menu menu) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(32.0),
          bottomRight: Radius.circular(32.0),
        ),
        child: Container(
          color: AppColors.secondaryOrange,
          width: double.infinity,
          height: 3 / 4 * Get.width,
          child: menu.images.isNotEmpty
              ? InkWell(
                  onTap: () => Get.toNamed(
                    CarouselPage.routeName,
                    arguments: {'menuId': menu.id},
                  ),
                  child: CachedNetworkImage(
                    imageUrl: menu.images.first,
                    fit: BoxFit.cover,
                    placeholder: (context, url) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      );
                    },
                  ),
                )
              : Image.asset(
                  AssetImages.foodIcon,
                  scale: 0.5,
                ),
        ),
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
          const Spacing.large(),
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
    );
  }
}
