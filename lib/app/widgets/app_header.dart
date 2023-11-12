import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/app_text_style.dart';
import 'widgets.dart';

class AppHeader extends StatelessWidget {
  final String title;
  final List<Widget>? actions;
  final bool centerTitle;
  final Color bgColor;
  final Color iconBgColor;
  final Color iconColor;
  final double elevationIcon;
  final VoidCallback? onTapBack;

  const AppHeader({
    Key? key,
    this.title = '',
    this.actions,
    this.centerTitle = false,
    this.bgColor = Colors.transparent,
    this.iconBgColor = Colors.transparent,
    this.elevationIcon = 0,
    this.iconColor = Colors.black,
    this.onTapBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        height: kToolbarHeight + 24.0,
        decoration: BoxDecoration(color: bgColor),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Material(
              color: iconBgColor,
              borderRadius: BorderRadius.circular(30),
              elevation: elevationIcon,
              child: onTapBack != null
                  ? IconButton(
                      splashRadius: 1,
                      onPressed: () {
                        onTapBack != null ? onTapBack!() : Get.back();
                      },
                      alignment: Alignment.topCenter,
                      visualDensity:
                          const VisualDensity(horizontal: 0, vertical: 0),
                      icon: Icon(Icons.arrow_back_ios_new_rounded,
                          size: 30, color: iconColor),
                    )
                  : const SizedBox(width: 24.0),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: AppText(
                title,
                style:
                    AppTextStyle.title1.copyWith(fontWeight: FontWeight.w600),
                textAlign: centerTitle ? TextAlign.center : TextAlign.start,
              ),
            ),
            if (actions != null) ...actions!,
          ],
        ),
      ),
    );
  }
}
