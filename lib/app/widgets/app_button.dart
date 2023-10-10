import 'package:flutter/material.dart';
import 'package:menu_barcode_apps/app/constants/app_text_style.dart';
import 'package:menu_barcode_apps/app/widgets/app_text.dart';

import '../constants/app_colors.dart';

enum AppButtonVariant {
  primary,
  secondary,
  other,
}

enum AppButtonSize {
  small,
  regular,
  big,
}

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final BorderRadius? borderRadius;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final EdgeInsets margin;
  final bool disabled;
  final AppButtonVariant variant;
  final AppButtonSize size;
  final bool useBorder;
  const AppButton({
    Key? key,
    required this.label,
    required this.onTap,
    this.borderRadius,
    this.prefixIcon = const SizedBox.shrink(),
    this.suffixIcon = const SizedBox.shrink(),
    this.margin = EdgeInsets.zero,
    this.disabled = false,
    this.variant = AppButtonVariant.primary,
    this.size = AppButtonSize.big,
    this.useBorder = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BorderRadius initialBorderRadius = BorderRadius.circular(30);
    return Padding(
      padding: margin,
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        borderRadius: borderRadius ?? initialBorderRadius,
        onTap: () {
          if (!disabled) {
            FocusManager.instance.primaryFocus?.unfocus();
            onTap();
          }
        },
        child: Container(
          decoration: BoxDecoration(
            color: bgColor,
            border:
                useBorder ? Border.all(color: Colors.white, width: 2) : null,
            borderRadius: borderRadius ?? initialBorderRadius,
          ),
          padding: paddingValue,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize:
                size != AppButtonSize.big ? MainAxisSize.min : MainAxisSize.max,
            children: [
              prefixIcon,
              AppText(label, style: disabled ? disabledLabelStyle : labelStyle),
              suffixIcon
            ],
          ),
        ),
      ),
    );
  }

  Color get bgColor {
    switch (variant) {
      default:
        return AppColors.primaryOrange;
    }
  }

  Color get disabledBgColor {
    switch (variant) {
      default:
        return AppColors.primaryOrange.withAlpha(100);
    }
  }

  Color get labelColor {
    switch (variant) {
      default:
        return Colors.white;
    }
  }

  Color get disabledLabelColor {
    switch (variant) {
      default:
        return Colors.black26;
    }
  }

  TextStyle get labelStyle {
    switch (size) {
      case AppButtonSize.small:
        return AppTextStyle.caption.copyWith(color: labelColor);
      case AppButtonSize.regular:
        return AppTextStyle.body1.copyWith(color: labelColor);
      default:
        return AppTextStyle.title2
            .copyWith(fontWeight: FontWeight.w600, color: labelColor);
    }
  }

  TextStyle get disabledLabelStyle {
    switch (size) {
      case AppButtonSize.small:
        return AppTextStyle.caption.copyWith(color: disabledLabelColor);
      case AppButtonSize.regular:
        return AppTextStyle.body1.copyWith(color: disabledLabelColor);
      default:
        return AppTextStyle.title2
            .copyWith(fontWeight: FontWeight.w600, color: disabledLabelColor);
    }
  }

  EdgeInsets get paddingValue {
    switch (size) {
      case AppButtonSize.small:
        return const EdgeInsets.symmetric(horizontal: 15, vertical: 10);
      case AppButtonSize.regular:
        return const EdgeInsets.symmetric(horizontal: 20, vertical: 10);
      default:
        return const EdgeInsets.symmetric(horizontal: 20, vertical: 15);
    }
  }
}
