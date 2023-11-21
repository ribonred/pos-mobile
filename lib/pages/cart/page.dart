import 'package:flutter/material.dart';

import '../../components/components.dart';
import '../../utils/asset_images.dart';
import '../../utils/colors.dart';

class CartPage extends StatelessWidget {
  static const String routeName = '/cart';

  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: RotatedBox(
              quarterTurns: 2,
              child: ColorFiltered(
                colorFilter: const ColorFilter.mode(
                  Colors.grey,
                  BlendMode.srcIn,
                ),
                child: Image.asset(
                  AssetImages.foodVector,
                  height: 200.0,
                  width: 200.0,
                  opacity: const AlwaysStoppedAnimation(0.3),
                  colorBlendMode: BlendMode.srcATop,
                ),
              ),
            ),
          ),
          Column(
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(32.0, 32.0, 32.0, 0.0),
                child: TitleBar(
                  title: 'My cart',
                  showBackButton: true,
                  addPadding: true,
                ),
              ),
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(32.0),
                  children: [
                    CartItem(
                      name: 'Beef Burger',
                      price: 120000,
                      rating: 4.9,
                      qty: 1,
                      onQtyChanged: (value) {},
                      onRemove: () {},
                    ),
                    const Spacing(),
                    CartItem(
                      name: 'Rice with chicken',
                      price: 24000,
                      rating: 4.4,
                      qty: 1,
                      onQtyChanged: (value) {},
                      onRemove: () {},
                    )
                  ],
                ),
              ),
              Container(
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
                            const Price(120000),
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
                            const Price(12000),
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
                              const Price(132000),
                            ],
                          ),
                          const Spacing(),
                          AppButton(
                            onPressed: () {},
                            label: 'Checkout',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  final String name;
  final int price;
  final double rating;
  final int qty;
  final void Function(int value) onQtyChanged;
  final VoidCallback onRemove;

  const CartItem({
    super.key,
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
        color: AppColors.lightGray,
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
              child: Image.asset(AssetImages.foodIcon),
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
                          ),
                          const Spacing.horizontal(),
                          Rating(rating, size: 14.0),
                        ],
                      ),
                    ],
                  ),
                ),
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
