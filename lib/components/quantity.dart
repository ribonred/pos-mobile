import 'package:flutter/material.dart';

import '../utils/colors.dart';

class Quantity extends StatelessWidget {
  final int quantity;
  final void Function(int) onChanged;
  final int? max;
  final double size;
  final bool withContainer;

  const Quantity({
    super.key,
    required this.quantity,
    required this.onChanged,
    this.max,
    this.size = 32.0,
    this.withContainer = true,
  });

  @override
  Widget build(BuildContext context) {
    return withContainer
        ? Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(64.0),
              boxShadow: [
                BoxShadow(
                  blurRadius: 6.0,
                  offset: const Offset(0, 2),
                  color: Colors.black.withOpacity(.2),
                ),
              ],
            ),
            child: _buildButtons(context),
          )
        : _buildButtons(context);
  }

  Widget _buildButtons(BuildContext context) {
    bool unlimited = max == null;
    bool canDecrease = !unlimited && quantity > 1;
    bool canIncrease = !unlimited && quantity < max!;

    return Row(
      children: [
        IconButton(
          onPressed:
              unlimited || canDecrease ? () => onChanged(quantity - 1) : null,
          icon: Icon(
            unlimited || canDecrease
                ? Icons.remove_circle
                : Icons.remove_circle_outline,
            size: size,
            color: AppColors.primaryOrange,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 3 / 4 * size),
          child: Text(
            quantity.toString(),
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontSize: size,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryOrange,
                ),
          ),
        ),
        IconButton(
          onPressed:
              unlimited || canIncrease ? () => onChanged(quantity + 1) : null,
          icon: Icon(
            unlimited || canIncrease
                ? Icons.add_circle
                : Icons.add_circle_outline,
            size: size,
            color: AppColors.primaryOrange,
          ),
        ),
      ],
    );
  }
}
