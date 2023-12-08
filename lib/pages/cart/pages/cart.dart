import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/components.dart';
import '../../../models/models.dart';
import '../../../utils/asset_images.dart';
import '../../pages.dart';
import '../components/components.dart';

class CartPage extends GetView<CartController> {
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
                child: GetBuilder<CartController>(
                  initState: (state) => controller.refreshItems(),
                  builder: (controller) => _buildList(controller),
                ),
              ),
              Totals(
                buttonLabel: 'Checkout',
                onProceed: () => Get.toNamed(PaymentPage.routeName),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildList(CartController controller) {
    if (controller.items.isEmpty) {
      return const Center(
        child: Text('No orders yet, go order something!'),
      );
    }

    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(32.0),
      itemCount: controller.items.length,
      itemBuilder: (context, index) {
        OrderItem item = controller.items[index];

        return CartItem(
          name: item.productName,
          price: item.productPrice,
          rating: 5.0,
          qty: item.quantity,
          onQtyChanged: (value) => controller.updateItemCount(item.id, value),
          onRemove: () => controller.deleteItem(item.id),
        );
      },
      separatorBuilder: (context, index) => const Spacing(),
    );
  }
}
