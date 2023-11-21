import 'package:flutter/material.dart';

import '../utils/colors.dart';

class Rating extends StatelessWidget {
  final double rating;
  final double size;

  const Rating(this.rating, {super.key, this.size = 16.0});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          rating.toString(),
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: size,
              ),
        ),
        Icon(Icons.star, size: size - 2.0, color: AppColors.primaryOrange),
      ],
    );
  }
}
