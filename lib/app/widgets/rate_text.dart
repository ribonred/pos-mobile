import 'package:flutter/material.dart';
import 'package:menu_barcode_apps/app/constants/app_colors.dart';
import 'package:menu_barcode_apps/app/constants/app_text_style.dart';

import 'widgets.dart';

enum RateTextSize {
  small,
  medium,
  big,
}

class RateText extends StatelessWidget {
  final double rate;
  final RateTextSize size;
  const RateText({Key? key, this.rate = 0, this.size = RateTextSize.medium})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppText(
          rate.toString(),
          style: labelSize,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 2),
          child: Icon(
            Icons.star,
            size: starSize,
            color: AppColors.primaryOrange,
          ),
        ),
      ],
    );
  }

  TextStyle get labelSize {
    switch (size) {
      case RateTextSize.small:
        return AppTextStyle.caption.copyWith(color: Colors.grey.shade700);
      case RateTextSize.big:
        return AppTextStyle.body1.copyWith(color: Colors.grey.shade700);
      default:
        return AppTextStyle.body2.copyWith(color: Colors.grey.shade700);
    }
  }

  double get starSize {
    switch (size) {
      case RateTextSize.small:
        return 13;
      case RateTextSize.big:
        return 18;
      default:
        return 15;
    }
  }
}
