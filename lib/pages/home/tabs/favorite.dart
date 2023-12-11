import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/components.dart';
import '../../../controllers/controllers.dart';
import '../../../models/models.dart';
import '../../../utils/asset_images.dart';
import '../../../utils/colors.dart';
import '../../pages.dart';

class FavoriteTab extends GetView<POSMenuController> {
  const FavoriteTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TitleBar(title: 'Favorites', addPadding: false),
        const Spacing.large(),
        Expanded(
          child: GetX<HomeController>(
            builder: (controller) {
              return ListView.separated(
                itemCount: controller.favorites.length,
                itemBuilder: (context, index) {
                  Menu menu = controller.favorites[index];

                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: InkWell(
                      onTap: () => Get.toNamed(
                        MenuPage.routeName,
                        arguments: {'menuId': menu.id},
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
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16.0),
                                child: Container(
                                  color: AppColors.secondaryOrange,
                                  width: 64.0,
                                  height: 64.0,
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
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      menu.name,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge
                                          ?.copyWith(
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                    const Spacing.xsmall(),
                                    Row(
                                      children: [
                                        Price(
                                          menu.price,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                        ),
                                        const Spacing.horizontalSmall(),
                                        const Rating(4.8, size: 14.0),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16.0,
                              ),
                              child: Favorite(menu: menu),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => const Spacing.small(),
              );
            },
          ),
        ),
      ],
    );
  }
}
