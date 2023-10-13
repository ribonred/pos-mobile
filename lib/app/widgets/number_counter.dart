import 'package:flutter/material.dart';
import 'package:menu_barcode_apps/app/constants/app_colors.dart';
import 'package:menu_barcode_apps/app/widgets/widgets.dart';

enum NumberCounterSize {
  small,
  regular,
}

class NumberCounter extends StatelessWidget {
  final int value;
  final NumberCounterSize size;
  const NumberCounter({
    Key? key,
    this.value = 0,
    this.size = NumberCounterSize.regular,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: containerWidth,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            blurRadius: 2,
            offset: const Offset(0, 1),
            color: Colors.black.withOpacity(.1),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.all(8),
            height: 25,
            width: 25,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.primaryOrange, width: 2)),
            child: Center(
                child: Icon(
              Icons.remove,
              color: AppColors.primaryOrange,
              size: iconSize,
              // weight: 50,
            )),
          ),
          AppText(
            value.toString(),
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.w600,
              color: AppColors.primaryOrange,
            ),
          ),
          Container(
            margin: const EdgeInsets.all(8),
            height: 25,
            width: 25,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.primaryOrange, width: 2)),
            child: Icon(
              Icons.add,
              size: iconSize,
              color: AppColors.primaryOrange,
              weight: 50,
            ),
          ),
        ],
      ),
    );
  }

  double get containerWidth {
    switch (size) {
      case NumberCounterSize.small:
        return 83;
      default:
        return 132;
    }
  }

  double get fontSize {
    switch (size) {
      case NumberCounterSize.small:
        return 15;
      default:
        return 24;
    }
  }

  double get iconSize {
    switch (size) {
      case NumberCounterSize.small:
        return 15;
      default:
        return 20;
    }
  }
}
