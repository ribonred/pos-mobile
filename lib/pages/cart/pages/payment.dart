import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/components.dart';
import '../../../utils/asset_images.dart';
import '../../../utils/colors.dart';
import '../../pages.dart';
import '../components/components.dart';

class PaymentPage extends GetView<CartController> {
  static const String routeName = '/payment';

  const PaymentPage({super.key});

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
                  title: 'Payment',
                  showBackButton: true,
                  addPadding: true,
                ),
              ),
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(32.0),
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16.0),
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
                          const Icon(
                            Icons.attach_money,
                            size: 32.0,
                            color: AppColors.secondaryOrange,
                          ),
                          const Spacing.horizontalSmall(),
                          Text(
                            'Cash to cashier',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const Spacer(),
                          Switch(
                            activeTrackColor: AppColors.primaryOrange,
                            value: true,
                            onChanged: (_) {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Totals(
                buttonLabel: 'Pay now',
                onProceed: () => Get.toNamed(CashierConfirmationPage.routeName),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
