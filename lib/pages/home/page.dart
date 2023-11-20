import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/controllers.dart';
import '../../utils/colors.dart';
import '../pages.dart';
import 'controller.dart';
import 'tabs/tabs.dart';

class HomePage extends GetView<HomeController> {
  static const String routeName = '/';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final POSMenuController menuController = Get.find();
    final List<Map> tabItems = [
      {
        'icon': Icons.home_outlined,
        'activeIcon': Icons.home,
        'tab': const HomeTab(),
      },
      {
        'icon': Icons.search_outlined,
        'activeIcon': Icons.search,
        'tab': const SearchTab(),
      },
      {
        'icon': Icons.favorite_outline,
        'activeIcon': Icons.favorite,
        'tab': const FavoriteTab(),
      },
      {
        'icon': Icons.shopping_cart_outlined,
        'activeIcon': Icons.shopping_cart,
        'tab': const HomeTab(),
      },
    ];

    return GetX<HomeController>(
      initState: (state) {
        String? merchantId = Get.arguments?['merchantId'];

        if (merchantId != null) {
          menuController.getMenu(merchantId);
          controller.db.settings.put('merchantId', merchantId);
        }
      },
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.primaryOrange,
          body: Stack(
            fit: StackFit.expand,
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(32.0),
                    bottomRight: Radius.circular(32.0),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                  32.0,
                  MediaQuery.of(context).viewPadding.top + 32.0,
                  32.0,
                  0.0,
                ),
                child: AnimatedSwitcher(
                  child: tabItems[controller.currentIndex.value]['tab'],
                  duration: const Duration(milliseconds: 300),
                ),
              )
            ],
          ),
          bottomNavigationBar: Container(
            color: AppColors.primaryOrange,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: tabItems.map(
                (e) {
                  int currentIndex = controller.currentIndex.value;
                  int tabIndex = tabItems.indexOf(e);

                  return _buildNavigationIcon(
                    icon: e['icon'],
                    activeIcon: e['activeIcon'],
                    onPressed: () => controller.currentIndex.value = tabIndex,
                    isActive: currentIndex == tabIndex,
                  );
                },
              ).toList(),
            ),
          ),
        );
      },
    );
  }

  IconButton _buildNavigationIcon({
    required VoidCallback onPressed,
    required IconData icon,
    required IconData activeIcon,
    bool isActive = false,
  }) {
    return IconButton(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      onPressed: onPressed,
      icon: Icon(isActive ? activeIcon : icon),
      color: Colors.white,
    );
  }
}
