import 'package:flutter/material.dart';
import 'package:menu_barcode_apps/app/constants/app_text_style.dart';

class AppText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final bool ellipsis;
  final TextAlign textAlign;
  final int? maxLines;
  final bool applyHeightToFirstAscent;

  const AppText(
    this.text, {
    Key? key,
    this.ellipsis = false,
    this.textAlign = TextAlign.start,
    this.maxLines,
    this.style,
    this.applyHeightToFirstAscent = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: style ?? AppTextStyle.body1,
        textAlign: textAlign,
        overflow: ellipsis ? TextOverflow.ellipsis : null,
        maxLines: maxLines,
        textHeightBehavior: TextHeightBehavior(
            applyHeightToFirstAscent: applyHeightToFirstAscent));
  }
}
