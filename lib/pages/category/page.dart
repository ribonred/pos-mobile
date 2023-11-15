import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../../components/components.dart';
import '../../controllers/controllers.dart';
import '../../models/pos_responses.dart';
import '../../utils/colors.dart';

class CategoryPage extends GetView<POSMenuController> {
  static const String routeName = '/menu/:category';

  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    String category = Get.parameters['category'] ?? 'Food';

    return Scaffold(
      body: GetBuilder<POSMenuController>(
        builder: (context) {
          List<Menu> menus = controller.menu!
              .where((menu) => menu.category.contains(category))
              .toList();

          if (category == 'food') {
            menus = controller.menu!;
          }

          return Padding(
            padding: const EdgeInsets.all(32.0),
            child: SingleChildScrollView(
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
                  MasonryGridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    mainAxisSpacing: 8.0,
                    crossAxisSpacing: 8.0,
                    itemCount: menus.length,
                    itemBuilder: (context, index) {
                      return _buildCategoryItem(context, menu: menus[index]);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildCategoryItem(BuildContext context, {required Menu menu}) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
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
                    child: CachedNetworkImage(
                      imageUrl: 'https://picsum.photos/300/200',
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: CircularProgressIndicator(
                              value: downloadProgress.progress,
                            ),
                          ),
                        );
                      },
                      errorWidget: (context, url, error) {
                        return const Icon(Icons.error);
                      },
                      width: double.infinity,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            4.0.toString(),
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          const Icon(
                            Icons.star,
                            size: 12.0,
                            color: AppColors.primaryOrange,
                          ),
                        ],
                      ),
                      Text.rich(
                        TextSpan(
                          text: 'Rp. ',
                          children: [
                            TextSpan(
                              text: menu.priceDisplay.split('Rp ')[1],
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
