import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_mobile_client/controllers/controllers.dart';

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
                child: GetBuilder<POSController>(
                  id: 'cartChanged',
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

  Widget _buildList(POSController controller) {
    if (controller.cart.isEmpty) {
      return const Center(
        child: Text('No orders yet, go order something!'),
      );
    }

    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(32.0),
      itemCount: controller.cart.length,
      itemBuilder: (context, index) {
        OrderItem item = controller.cart[index];

        return CartItem(
          imageUrl: item.productImage,
          name: item.productName,
          price: item.productPrice,
          rating: 5.0,
          qty: item.quantity,
          onQtyChanged: (value) => CartController.to.updateQty(item.id, value),
          onRemove: () => CartController.to.deleteItem(item.id),
        );
      },
      separatorBuilder: (context, index) => const Spacing(),
    );
  }
}
