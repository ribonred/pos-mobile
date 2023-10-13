import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:menu_barcode_apps/features/home/home.dart';

import '../../../app/constants/app_text_style.dart';
import '../../../app/constants/images.dart';
import '../../../app/widgets/widgets.dart';
import '../../../core/widgets/widgets.dart';

class FoodDetailsScreen extends StatefulWidget {
  static const String route = '/detail_food_screen';
  static void open() => Get.toNamed(route);
  const FoodDetailsScreen({Key? key}) : super(key: key);

  @override
  State<FoodDetailsScreen> createState() => _FoodDetailsScreenState();
}

class _FoodDetailsScreenState extends State<FoodDetailsScreen> {
  int _value = 1;
  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Stack(
          children: [
            Align(
                alignment: Alignment.bottomLeft,
                child: getPngImage(AppImages.bottomHomeBg,
                    color: Colors.grey.withOpacity(.3))),
            Column(
              children: [
                Expanded(
                    child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 20),
                            height: MediaQuery.of(context).size.width,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(30)),
                            child: const Icon(Icons.image, size: 100),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 30,
                            child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black.withOpacity(.1),
                                          blurRadius: 2,
                                          offset: const Offset(0, 2))
                                    ],
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50)),
                                child: const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                  size: 30,
                                )),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 34),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(
                                  'Beef Wagyu',
                                  style: AppTextStyle.header,
                                ),
                                RateText(
                                  rate: data.toDouble(),
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  children: [
                                    Expanded(
                                        child: AppText(
                                      'Rp. 80.000',
                                      style: AppTextStyle.title2,
                                    )),
                                    const NumberCounter()
                                  ],
                                ),
                                const SizedBox(height: 20),
                                AppText(
                                  'About Food',
                                  style: AppTextStyle.headline
                                      .copyWith(fontWeight: FontWeight.w600),
                                ),
                                AppText(
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sit et viverra pellentesque et congue aliquam at eget suspendisse..',
                                  style: AppTextStyle.body2,
                                ),
                                const SizedBox(height: 20),
                                AppText(
                                  'Sauce',
                                  style: AppTextStyle.body1
                                      .copyWith(fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    MyRadioListTile(
                                      value: 1,
                                      groupValue: _value,
                                      leading: 'Spicy',
                                      onChanged: (value) =>
                                          setState(() => _value = value!),
                                    ),
                                    MyRadioListTile(
                                      value: 2,
                                      groupValue: _value,
                                      leading: 'Cheese',
                                      onChanged: (value) =>
                                          setState(() => _value = value!),
                                    ),
                                    MyRadioListTile(
                                      value: 3,
                                      groupValue: _value,
                                      leading: 'Brown',
                                      onChanged: (value) =>
                                          setState(() => _value = value!),
                                    ),
                                    MyRadioListTile(
                                      value: 4,
                                      groupValue: _value,
                                      leading: 'Curry',
                                      onChanged: (value) =>
                                          setState(() => _value = value!),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
                AppButton(
                    margin: const EdgeInsets.fromLTRB(34, 10, 34, 40),
                    label: 'Add to Cart',
                    onTap: () => Get.toNamed(CartScreen.route))
              ],
            )
          ],
        ),
      ),
    );
  }
}
