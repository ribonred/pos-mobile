import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TitleBar extends StatelessWidget {
  final String title;
  final bool showBackButton;
  final bool addPadding;

  const TitleBar({
    super.key,
    required this.title,
    this.showBackButton = false,
    this.addPadding = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: addPadding ? const EdgeInsets.only(top: 26.0) : EdgeInsets.zero,
      child: Row(
        children: [
          if (showBackButton)
            IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(Icons.arrow_back_ios_new),
              padding: const EdgeInsets.fromLTRB(0.0, 8.0, 8.0, 8.0),
            ),
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .headlineLarge
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
