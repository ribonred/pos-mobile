import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/components.dart';
import '../../../controllers/controllers.dart';
import '../../../models/models.dart';

class CarouselPage extends StatelessWidget {
  static const String routeName = '/menu/:menuId/images';

  const CarouselPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          GetBuilder<POSMenuController>(
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

              return SafeArea(
                child: CarouselSlider.builder(
                  options: CarouselOptions(
                    height: Get.height,
                    viewportFraction: 1.0,
                    // enableInfiniteScroll: false,
                  ),
                  itemCount: menu.images.length,
                  itemBuilder: (context, int itemIndex, int pageViewIndex) {
                    return CachedNetworkImage(
                      imageUrl: menu.images[itemIndex],
                      fit: BoxFit.contain,
                      placeholder: (context, url) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        );
                      },
                    );
                  },
                ),
              );
            },
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
      ),
    );
  }
}
