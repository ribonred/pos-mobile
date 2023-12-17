import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../components/components.dart';
import '../../../utils/asset_images.dart';
import '../../../utils/colors.dart';

class CartItem extends StatelessWidget {
  final String? imageUrl;
  final String name;
  final double price;
  final double rating;
  final int qty;
  final void Function(int value) onQtyChanged;
  final VoidCallback onRemove;

  const CartItem({
    super.key,
    this.imageUrl,
    required this.name,
    required this.price,
    required this.rating,
    required this.qty,
    required this.onQtyChanged,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.0),
        boxShadow: [
          BoxShadow(
            blurRadius: 6.0,
            offset: const Offset(0, 2),
            color: Colors.black.withOpacity(.2),
          ),
        ],
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.secondaryOrange,
                borderRadius: BorderRadius.circular(24.0),
              ),
              width: 96.0,
              height: 96.0,
              child: imageUrl != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(24.0),
                      child: CachedNetworkImage(
                        imageUrl: imageUrl!,
                        fit: BoxFit.cover,
                        placeholder: (context, url) {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          );
                        },
                      ),
                    )
                  : Image.asset(AssetImages.foodIcon),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      const Spacing.xsmall(),
                      Row(
                        children: [
                          Price(
                            price,
                            style: Theme.of(context).textTheme.bodyLarge,
                            usdFormat: false,
                          ),
                          const Spacing.horizontal(),
                          Rating(rating, size: 14.0),
                        ],
                      ),
                    ],
                  ),
                ),
                const Spacing.small(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Quantity(
                        quantity: qty,
                        onChanged: onQtyChanged,
                        size: 18.0,
                        withContainer: false,
                      ),
                    ),
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(24.0),
                      ),
                      child: ElevatedButton(
                        onPressed: onRemove,
                        style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8.0),
                            ),
                          ),
                          backgroundColor: AppColors.primaryOrange,
                          foregroundColor: Colors.white,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: const Icon(Icons.delete),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
