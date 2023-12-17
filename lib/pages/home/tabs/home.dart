import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../components/components.dart';
import '../../../utils/utils.dart';
import '../../../controllers/controllers.dart';
import '../../pages.dart';

class HomeTab extends GetView<POSController> {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    DateFormat dateFormat = DateFormat('EEEE');
    String currentDay = dateFormat.format(DateTime.now());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TitleBar(title: 'Happy $currentDay!!', addPadding: false),
        const Spacing.small(),
        Text(
          'What do you want to eat?',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const Spacing.large(),
        const AppTextInput(),
        const Spacing.xxlarge(),
        Text(
          'Categories',
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(fontWeight: FontWeight.w600),
        ),
        Expanded(
          child: RefreshIndicator(
            onRefresh: () => controller.getMenu(),
            child: GridView.count(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(vertical: 18.0),
              crossAxisCount: 2,
              mainAxisSpacing: 18.0,
              children: controller.menuCategories
                  .map(
                    (e) => _buildCategoryCard(
                      label: e['name'],
                      iconFile: e['icon'],
                      onTap: () => Get.toNamed(
                        CategoryPage.routeName,
                        arguments: {'category': e['category']},
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryCard({
    required String label,
    required String iconFile,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16.0),
      splashColor: AppColors.primaryOrange,
      highlightColor: AppColors.primaryOrange,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(40.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: AppColors.secondaryOrange,
              boxShadow: [
                BoxShadow(
                  blurRadius: 6.0,
                  offset: const Offset(0, 2),
                  color: Colors.black.withOpacity(.3),
                )
              ],
            ),
            child: Image.asset(iconFile, width: 64.0, height: 64.0),
          ),
          const Spacing.small(),
          Text(
            label,
            style: Theme.of(Get.context!)
                .textTheme
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
