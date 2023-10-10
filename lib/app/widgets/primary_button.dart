import 'package:flutter/material.dart';

import 'package:menu_barcode_apps/app/widgets/widgets.dart';

enum PrimaryButtonType {
  primary,
  secondary,
  other,
}

class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const PrimaryButton({
    Key? key,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: CustomText(label),
        ));
  }
}
