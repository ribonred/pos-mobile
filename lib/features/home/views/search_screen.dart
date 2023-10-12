import 'package:flutter/widgets.dart';
import 'package:menu_barcode_apps/app/widgets/widgets.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        AppText('Search Screen'),
        Placeholder(),
      ],
    );
  }
}
