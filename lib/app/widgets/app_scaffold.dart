import 'package:flutter/material.dart';
import 'package:menu_barcode_apps/app/constants/app_text_style.dart';
import 'package:menu_barcode_apps/app/widgets/app_text.dart';

class AppScaffold extends StatelessWidget {
  final Widget body;
  final Color bgColor;
  final bool useHeader;
  final String title;
  const AppScaffold({
    Key? key,
    required this.body,
    this.bgColor = Colors.white,
    this.useHeader = false,
    this.title = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Column(
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                  )),
              AppText(
                title,
                style: AppTextStyle.title1,
              )
            ],
          ),
          Expanded(child: body),
        ],
      ),
    );
  }
}
