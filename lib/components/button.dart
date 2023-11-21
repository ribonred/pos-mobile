import 'package:flutter/material.dart';

import '../utils/colors.dart';
import 'components.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final bool outlined;
  final Widget? leading;
  final Widget? trailing;

  const AppButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.outlined = false,
    this.leading,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    EdgeInsets padding = const EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 20,
    );
    Color backgroundColor =
        outlined ? Colors.transparent : AppColors.primaryOrange;
    Color foregroundColor = outlined ? AppColors.primaryOrange : Colors.white;
    TextStyle? textStyle = Theme.of(context)
        .textTheme
        .headlineMedium
        ?.copyWith(fontWeight: FontWeight.w600);
    Widget labelWidget = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (leading != null) ...[leading!, const Spacing.horizontal()],
        Text(label),
        if (trailing != null) ...[
          const Spacing.horizontal(),
          trailing!,
        ]
      ],
    );

    return outlined
        ? OutlinedButton(
            style: OutlinedButton.styleFrom(
              padding: padding,
              side: const BorderSide(
                color: Colors.white,
              ),
              backgroundColor: backgroundColor,
              foregroundColor: foregroundColor,
              textStyle: textStyle,
            ),
            onPressed: onPressed,
            child: labelWidget,
          )
        : ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: padding,
              backgroundColor: backgroundColor,
              foregroundColor: foregroundColor,
              textStyle: textStyle,
            ),
            onPressed: onPressed,
            child: labelWidget,
          );
  }
}
