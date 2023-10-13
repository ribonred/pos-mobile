import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/home.dart';

class PaymentScreen extends StatefulWidget {
  static const String route = '/payment_page';
  static void open(BuildContext context) => Navigator.pushNamed(context, route);
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

String _finalSelection = "";

class _PaymentScreenState extends State<PaymentScreen> {
  static List<bool> choice = [false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 0, right: 0),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: const Text(
                'Payment',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.black,
                ),
                onPressed: () => Get.back(),
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Column(
                  children: [
                    const SizedBox(height: 25),
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Payment Method",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Container(
                      height: 60,
                      width: 300,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset: const Offset(0, 3),
                            )
                          ]),
                      child: SwitchListTile(
                        title: const Text('Shopee Pay'),
                        value: choice[0],
                        onChanged: (bool value) {
                          switchCallback(value, 0);
                        },
                        secondary: const Icon(Icons.payment),
                        activeColor: const Color.fromARGB(255, 255, 122, 0),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: 60,
                      width: 300,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset: const Offset(0, 3),
                            )
                          ]),
                      child: SwitchListTile(
                        title: const Text('OVO'),
                        value: choice[1],
                        onChanged: (bool value) {
                          switchCallback(value, 1);
                        },
                        secondary: const Icon(Icons.payment),
                        activeColor: const Color.fromARGB(255, 255, 122, 0),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: 60,
                      width: 300,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset: const Offset(0, 3),
                            )
                          ]),
                      child: SwitchListTile(
                        title: const Text('Gopay'),
                        value: choice[2],
                        onChanged: (bool value) {
                          switchCallback(value, 2);
                        },
                        secondary: const Icon(Icons.payment),
                        activeColor: const Color.fromARGB(255, 255, 122, 0),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: 60,
                      width: 300,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset: const Offset(0, 3),
                            )
                          ]),
                      child: SwitchListTile(
                        title: const Text('Dana'),
                        value: choice[3],
                        onChanged: (bool value) {
                          switchCallback(value, 3);
                        },
                        secondary: const Icon(Icons.payment),
                        activeColor: const Color.fromARGB(255, 255, 122, 0),
                      ),
                    ),
                    const SizedBox(height: 130),
                    Column(
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Subtotal",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 17),
                            ),
                            Text(
                              "Rp.310.000",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Tax",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 17),
                            ),
                            Text(
                              "Rp.31.000",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                          ],
                        ),
                        const SizedBox(height: 40),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 17),
                            ),
                            Text(
                              "Rp.341.000",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () => HomeScreen.open(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 255, 122, 0),
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
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void switchCallback(bool value, int index) {
    setState(() {
      for (var i = 0; i < choice.length; i++) {
        choice[i] = false;
      }

      print(' click $index');
      choice[index] = value;

      _finalSelection = ' index $index  {$value}';
      print(' final selection $_finalSelection');
    });
  }
}
