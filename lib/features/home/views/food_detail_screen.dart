import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../core/widgets/widgets.dart';
import 'views.dart';

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
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/kategori/ramen.png"),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("IndoEmi Elite",
                            style: TextStyle(fontSize: 34)),
                        IconButton(
                          icon: Image.asset(
                            "assets/kategori/love_button.png",
                            fit: BoxFit.cover,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(data.toString(), style: TextStyle(fontSize: 15)),
                        const Icon(
                          Icons.star,
                          color: Color.fromARGB(255, 255, 122, 0),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Rp.80.000",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 23,
                              fontWeight: FontWeight.w400),
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
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              "1",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 122, 0),
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              width: 10,
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
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "About the food",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sit et viverra pellentesque et congue aliquam at eget suspendisse..",
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    const Text(
                      "Sauce",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyRadioListTile<int>(
                          value: 1,
                          groupValue: _value,
                          leading: 'Spicy',
                          onChanged: (value) => setState(() => _value = value!),
                        ),
                        MyRadioListTile<int>(
                          value: 2,
                          groupValue: _value,
                          leading: 'Cheese',
                          onChanged: (value) => setState(() => _value = value!),
                        ),
                        MyRadioListTile<int>(
                          value: 3,
                          groupValue: _value,
                          leading: 'Brown',
                          onChanged: (value) => setState(() => _value = value!),
                        ),
                        MyRadioListTile<int>(
                          value: 4,
                          groupValue: _value,
                          leading: 'Curry',
                          onChanged: (value) => setState(() => _value = value!),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () => CartScreen.open(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 255, 122, 0),
                          minimumSize: const Size(320, 40),
                          shape: const StadiumBorder(),
                          padding: const EdgeInsets.all(16),
                        ),
                        child: const Text(
                          'Add To Chart',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
