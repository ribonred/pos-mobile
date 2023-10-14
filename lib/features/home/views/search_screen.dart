import 'package:flutter/material.dart';
import 'package:menu_barcode_apps/app/constants/app_text_style.dart';
import 'package:menu_barcode_apps/features/home/widgets/main_page_container.dart';

import '../../../app/widgets/widgets.dart';

class SearchScreen extends StatelessWidget {
  static const String route = '/search_screen';

  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainPageContainer(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 34),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              'Search Screen',
              style: AppTextStyle.title1,
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: const [
                  Placeholder(),
                  Placeholder(),
                  Placeholder(),
                  Placeholder(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
