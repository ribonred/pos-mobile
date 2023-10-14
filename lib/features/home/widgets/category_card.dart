import 'package:flutter/material.dart';
import 'package:menu_barcode_apps/app/constants/app_text_style.dart';
import 'package:menu_barcode_apps/app/widgets/app_text.dart';

import '../../../app/constants/images.dart';

class CategoryCard extends StatelessWidget {
  final String label;
  final String iconFile;
  final VoidCallback onTap;
  const CategoryCard({
    Key? key,
    required this.label,
    required this.iconFile,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(.1),
                        blurRadius: 2,
                        offset: const Offset(0, 2))
                  ]),
              child: getPngImage(iconFile, color: Colors.white),
            ),
          ),
        ),
        AppText(
          label,
          style: AppTextStyle.body1
              .copyWith(fontWeight: FontWeight.w600, color: Colors.black87),
        ),
      ],
    );
  }
}
