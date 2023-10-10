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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BorderRadius initialBorderRadius = BorderRadius.circular(20);
    return Padding(
      padding: margin,
      child: Material(
        borderRadius: borderRadius ?? initialBorderRadius,
        color: disabled ? disabledBgColor : bgColor,
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
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: size != AppButtonSize.big
                  ? MainAxisSize.min
                  : MainAxisSize.max,
              children: [
                prefixIcon,
                AppText(label,
                    style: disabled ? disabledLabelStyle : labelStyle),
                suffixIcon
              ],
            ),
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
}
