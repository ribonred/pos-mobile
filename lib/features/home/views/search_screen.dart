import 'package:flutter/material.dart';
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
            const AppText('Search Screen'),
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
