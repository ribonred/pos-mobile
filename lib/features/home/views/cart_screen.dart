import 'package:flutter/material.dart';
import 'package:menu_barcode_apps/app/widgets/widgets.dart';

import '../../payment/payments.dart';
import 'views.dart';

class CartScreen extends StatelessWidget {
  static const String route = '/cart_screen';
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 0, right: 0),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Column(
                  children: [
                    const AppHeader(title: 'My Cart'),
                    Row(
                      children: [
                        Container(
                          height: 135,
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
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Container(
                                  height: 90,
                                  width: 90,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/kategori/KategoriPromo.png")),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 30, left: 0),
                                child: Column(
                                  children: [
                                    const Text(
                                      "Beef Wagyu",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    const SizedBox(height: 10),
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Rp.80.000",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          width: 18,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "4,9",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 11),
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Color.fromARGB(
                                                  255, 255, 122, 0),
                                              size: 11,
                                            )
                                          ],
                                        )
                                      ],
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
                                              color: Color.fromARGB(
                                                  255, 255, 122, 0),
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
                              ),
                              const SizedBox(width: 31),
                              SizedBox(
                                height: 150,
                                width: 40,
                                child: GestureDetector(
                                  onTap: () => HomeScreen.open(context),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        color: Color.fromARGB(255, 255, 122, 0),
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(20),
                                          bottomRight: Radius.circular(20),
                                        )),
                                    child: const Center(
                                        child: Icon(
                                      Icons.delete,
                                      color: Colors.white,
                                    )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Container(
                          height: 135,
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
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Container(
                                  height: 90,
                                  width: 90,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/kategori/KategoriPromo.png")),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 30, left: 0),
                                child: Column(
                                  children: [
                                    const Text(
                                      "Beef Wagyu",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    const SizedBox(height: 10),
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Rp.80.000",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          width: 18,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "4,9",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 11),
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Color.fromARGB(
                                                  255, 255, 122, 0),
                                              size: 11,
                                            )
                                          ],
                                        )
                                      ],
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
                                              color: Color.fromARGB(
                                                  255, 255, 122, 0),
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
                              ),
                              const SizedBox(width: 31),
                              SizedBox(
                                height: 150,
                                width: 40,
                                child: GestureDetector(
                                  onTap: () => HomeScreen.open(context),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        color: Color.fromARGB(255, 255, 122, 0),
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(20),
                                          bottomRight: Radius.circular(20),
                                        )),
                                    child: const Center(
                                        child: Icon(
                                      Icons.delete,
                                      color: Colors.white,
                                    )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 135,
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
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Container(
                                  height: 90,
                                  width: 90,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/kategori/KategoriPromo.png")),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 30, left: 0),
                                child: Column(
                                  children: [
                                    const Text(
                                      "Beef Wagyu",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Rp.80.000",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          width: 18,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "4,9",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 11),
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Color.fromARGB(
                                                  255, 255, 122, 0),
                                              size: 11,
                                            )
                                          ],
                                        )
                                      ],
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
                                              color: Color.fromARGB(
                                                  255, 255, 122, 0),
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
                              ),
                              const SizedBox(
                                width: 31,
                              ),
                              SizedBox(
                                height: 150,
                                width: 40,
                                child: GestureDetector(
                                  onTap: () => HomeScreen.open(context),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        color: Color.fromARGB(255, 255, 122, 0),
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(20),
                                          bottomRight: Radius.circular(20),
                                        )),
                                    child: const Center(
                                        child: Icon(
                                      Icons.delete,
                                      color: Colors.white,
                                    )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
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
                        const SizedBox(
                          height: 10,
                        ),
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
                        const SizedBox(
                          height: 40,
                        ),
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
                          onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => PaymentPage()),
                          ),
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

  static void open(BuildContext context) => Navigator.pushNamed(context, route);
}
