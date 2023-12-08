import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components.dart';

class ItemNotFoundBox extends StatelessWidget {
  final String message;
  final bool showBackButton;

  const ItemNotFoundBox({
    super.key,
    required this.message,
    this.showBackButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.question_mark_rounded,
              size: 120.0,
              color: Colors.grey,
            ),
            const Spacing.small(),
            Text(
              message,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            if (showBackButton) ...[
              const Spacing(),
              AppButton(
                onPressed: () => Get.back(),
                label: 'Back',
                outlined: true,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
