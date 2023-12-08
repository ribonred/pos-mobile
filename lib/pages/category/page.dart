import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../../components/components.dart';
import '../../controllers/controllers.dart';
import '../../models/models.dart';
import '../../utils/asset_images.dart';
import '../../utils/colors.dart';
import '../pages.dart';

class CategoryPage extends GetView<POSMenuController> {
  static const String routeName = '/menu';

  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    String category = Get.arguments?['category'] ?? 'Food';

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(32.0, 32.0, 32.0, 0.0),
        child: RefreshIndicator(
          onRefresh: () => controller.getMenu(),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TitleBar(
                  title: category.capitalizeFirst!,
                  showBackButton: true,
                  addPadding: true,
                ),
                const Spacing.large(),
                const AppTextInput(),
                const Spacing.small(),
                GetBuilder<POSMenuController>(builder: (controller) {
                  // is loading
                  if (controller.menu == null) {
                    return SizedBox(
                      height: Get.width,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }

                  // filter menu by category
                  List<Menu> menus = controller.menu!
                      .where((menu) => menu.category.contains(category))
                      .toList();

                  // if category is food, return all of them
                  if (category == 'food') {
                    menus = controller.menu!;
                  }

                  // if no menu found, show message
                  if (menus.isEmpty) {
                    return SizedBox(
                      height: Get.width,
                      child: const ItemNotFoundBox(
                        message: 'No items here...',
                      ),
                    );
                  }

                  // build everything
                  return MasonryGridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    mainAxisSpacing: 8.0,
                    crossAxisSpacing: 8.0,
                    itemCount: menus.length,
                    itemBuilder: (context, index) {
                      return _buildCategoryItem(context, menu: menus[index]);
                    },
                  );
                }),
                const Spacing.xlarge(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryItem(BuildContext context, {required Menu menu}) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: () => Get.toNamed(
          MenuPage.routeName,
          arguments: {
            'menuId': menu.id,
          },
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: [
              BoxShadow(
                blurRadius: 6.0,
                offset: const Offset(0, 2),
                color: Colors.black.withOpacity(.2),
              ),
            ],
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Container(
                        color: AppColors.secondaryOrange,
                        width: double.infinity,
                        height: 120.0,
                        child: menu.images.isNotEmpty
                            ? CachedNetworkImage(
                                imageUrl: menu.images.first,
                                fit: BoxFit.cover,
                                placeholder: (context, url) {
                                  return const Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  );
                                },
                              )
                            : Image.asset(AssetImages.foodIcon),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0.0,
                    right: 8.0,
                    child: FloatingActionButton.small(
                      shape: const CircleBorder(),
                      backgroundColor: Colors.white,
                      heroTag: '${menu.merchant}${menu.code}',
                      onPressed: () {},
                      child: const Icon(Icons.favorite_outline),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      menu.name,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.w600),
                    ),
                    const Spacing.xsmall(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Rating(4.8, size: 14.0),
                        Price(
                          menu.price,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
