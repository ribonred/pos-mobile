import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/components.dart';
import '../../../controllers/controllers.dart';
import '../../../utils/utils.dart';

class Totals extends StatelessWidget {
  final String buttonLabel;
  final VoidCallback onProceed;

  const Totals({super.key, required this.onProceed, required this.buttonLabel});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.lightGray,
        borderRadius: BorderRadius.circular(32.0),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Subtotal',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  GetBuilder<POSController>(
                    id: 'cartChanged',
                    builder: (controller) => Price(controller.total),
                  ),
                ],
              ),
              const Spacing(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Tax',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const Price(0),
                ],
              ),
            ]),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(32.0),
            ),
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    GetBuilder<POSController>(
                      id: 'cartChanged',
                      builder: (controller) => Price(controller.total),
                    ),
                  ],
                ),
                const Spacing(),
                GetBuilder<POSController>(
                  id: 'cartChanged',
                  builder: (controller) => AppButton(
                    onPressed: controller.total != "0.00" ? onProceed : null,
                    label: buttonLabel,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
