import 'package:flutter/material.dart';
import 'package:menu_barcode_apps/app/constants/app_text_style.dart';
import 'package:menu_barcode_apps/app/widgets/widgets.dart';

class AppHeader extends StatelessWidget {
  final String title;
  final bool centerTitle;
  final Color bgColor;
  final Color iconBgColor;
  final Color iconColor;
  final double elevationIcon;
  final VoidCallback? onTapBack;
  const AppHeader({
    Key? key,
    this.title = '',
    this.centerTitle = false,
    this.bgColor = Colors.transparent,
    this.iconBgColor = Colors.transparent,
    this.elevationIcon = 0,
    this.iconColor = Colors.black,
    this.onTapBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(color: bgColor),
      child: Row(
        children: [
          const SizedBox(width: 10),
          Material(
            color: iconBgColor,
            borderRadius: BorderRadius.circular(30),
            elevation: elevationIcon,
            child: IconButton(
              splashRadius: 1,
              onPressed: () {
                onTapBack != null ? onTapBack!() : Navigator.pop(context);
              },
              alignment: Alignment.topCenter,
              visualDensity: const VisualDensity(horizontal: 0, vertical: 0),
              icon: Icon(Icons.arrow_back_ios_new_rounded,
                  size: 30, color: iconColor),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
              child: AppText(
            title,
            style: AppTextStyle.title1.copyWith(fontWeight: FontWeight.w600),
            textAlign: centerTitle ? TextAlign.center : TextAlign.start,
          ))
        ],
      ),
    );
  }
}
