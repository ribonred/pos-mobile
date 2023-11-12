import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/constants/app_colors.dart';
import '../../../app/widgets/widgets.dart';
import '../../payment/payments.dart';
import '../home.dart';

class CartScreen extends StatelessWidget {
  static const String route = '/cart_screen';
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainPageContainer(
      child: Column(
        children: [
          const AppHeader(title: 'My Cart'),
          Expanded(
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, index) => itemRow(context),
              separatorBuilder: (context, index) => const SizedBox(height: 4.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Subtotal",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                    ),
                    Text(
                      "Rp.310.000",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Tax",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                    ),
                    Text(
                      "Rp.31.000",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                    ),
                    Text(
                      "Rp.341.000",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => Get.toNamed(PaymentScreen.route),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 255, 122, 0),
                    minimumSize: const Size(300, 40),
                    shape: const StadiumBorder(),
                    padding: const EdgeInsets.all(16),
                  ),
                  child: const Text(
                    'Checkout',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget itemRow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 4.0),
      child: Container(
        padding: const EdgeInsets.only(left: 109.0),
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage("assets/kategori/KategoriPromo.png"),
            alignment: Alignment.centerLeft,
          ),
          borderRadius: BorderRadius.circular(24.0),
          border: Border.all(color: AppColors.lightGray),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Beef Wagyu",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Chip(
                  labelPadding: EdgeInsets.symmetric(
                    vertical: 0.0,
                    horizontal: 4.0,
                  ),
                  label: Row(
                    children: [
                      Text(
                        "4,9",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 11,
                        ),
                      ),
                      Icon(
                        Icons.star,
                        color: Color.fromARGB(255, 255, 122, 0),
                        size: 11,
                      )
                    ],
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Rp.80.000",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Image.asset(
                        "assets/kategori/minus_button.png",
                        fit: BoxFit.cover,
                        scale: 1,
                      ),
                      onPressed: () {},
                    ),
                    const Text(
                      "1",
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 122, 0),
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                    IconButton(
                      icon: Image.asset(
                        "assets/kategori/plus_button.png",
                        fit: BoxFit.cover,
                        scale: 1,
                      ),
                      onPressed: () {},
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  static void open(BuildContext context) => Navigator.pushNamed(context, route);
}
