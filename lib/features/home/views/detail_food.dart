import 'package:flutter/material.dart';

import '../../../core/widgets/widgets.dart';
import 'views.dart';

class DetailFood extends StatefulWidget {
  static const String route = '/detail_food_screen';
  static void open(BuildContext context) => Navigator.pushNamed(context, route);
  const DetailFood({Key? key}) : super(key: key);

  @override
  State<DetailFood> createState() => _DetailFoodState();
}

class _DetailFoodState extends State<DetailFood> {
  int _value = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
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
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("IndoEmi Elite", style: TextStyle(fontSize: 34)),
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
                      Text("4,9", style: TextStyle(fontSize: 15)),
                      Icon(
                        Icons.star,
                        color: Color.fromARGB(255, 255, 122, 0),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
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
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "1",
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 122, 0),
                                fontSize: 25,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
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
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "About the food",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sit et viverra pellentesque et congue aliquam at eget suspendisse..",
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "Sauce",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                  SizedBox(
                    height: 5,
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () => CartScreen.open(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 255, 122, 0),
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
    );
  }
}
