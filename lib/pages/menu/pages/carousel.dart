import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

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
          GetBuilder<POSController>(
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
                child: PhotoViewGallery.builder(
                  scrollPhysics: const BouncingScrollPhysics(),
                  backgroundDecoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  builder: (BuildContext context, int index) {
                    return PhotoViewGalleryPageOptions(
                      imageProvider: CachedNetworkImageProvider(
                        menu.images[index],
                      ),
                      initialScale: PhotoViewComputedScale.contained,
                      heroAttributes: PhotoViewHeroAttributes(
                        tag: 'menu${menu.id}img$index',
                      ),
                    );
                  },
                  itemCount: menu.images.length,
                  loadingBuilder: (context, e) => Center(
                    child: SizedBox(
                      width: 32.0,
                      height: 32.0,
                      child: CircularProgressIndicator(
                        value: e == null
                            ? null
                            : e.cumulativeBytesLoaded / e.expectedTotalBytes!,
                      ),
                    ),
                  ),
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
