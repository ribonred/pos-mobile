import 'package:flutter/material.dart';

import 'views.dart';

class CategoriesPage extends StatefulWidget {
  static const String route = 'category_screen';
  static void open(BuildContext context) => Navigator.pushNamed(context, route);

  const CategoriesPage({Key? key}) : super(key: key);

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 0),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, top: 55),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Happy Sunday!!",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 28),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "What dou you want to eat?",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
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
                      child: Row(
                        children: [
                          Flexible(
                            flex: 1,
                            child: TextField(
                              cursorColor: Colors.grey,
                              decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide.none),
                                  hintText: 'Search',
                                  hintStyle: const TextStyle(
                                      color: Colors.grey, fontSize: 18),
                                  prefixIcon: Container(
                                    padding: const EdgeInsets.all(0),
                                    width: 18,
                                    child: IconButton(
                                      icon: const Icon(
                                        Icons.search,
                                        color: Colors.grey,
                                      ),
                                      onPressed: () {},
                                    ),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        "Categories",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Container(
                            height: 140,
                            width: 140,
                            child: GestureDetector(
                              onTap: () => FoodCategory.open(context),
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/kategori/KategoriMakanan.png")),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: SizedBox(
                            height: 140,
                            width: 140,
                            child: GestureDetector(
                              onTap: () => PromoCategories.open(context),
                              child: Container(
                                decoration: BoxDecoration(
                                  image: const DecorationImage(
                                      image: AssetImage(
                                          "assets/kategori/KategoriPromo.png")),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            'Food',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            'Promo',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Container(
                            height: 140,
                            width: 140,
                            child: GestureDetector(
                              onTap: () => SnackCategories.open(context),
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/kategori/KategoriSnack.png")),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: SizedBox(
                            height: 140,
                            width: 140,
                            child: GestureDetector(
                              onTap: () => DrinkCategories.open(context),
                              child: Container(
                                decoration: BoxDecoration(
                                  image: const DecorationImage(
                                      image: AssetImage(
                                          "assets/kategori/KategoriDrink.png")),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            'Snack',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            'Drink',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
          ),
          bottomSheet: Container(
            height: 90,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 122, 0),
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20))),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    decoration:
                        BoxDecoration(color: Color.fromARGB(255, 255, 122, 0)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 35, right: 35),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.home,
                                color: Colors.white,
                              )),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.search,
                                color: Colors.white,
                              )),
                          IconButton(
                              onPressed: () => FavoritePage.open(context),
                              icon: const Icon(
                                Icons.favorite_border,
                                color: Colors.white,
                              )),
                          IconButton(
                              onPressed: () => CartScreen.open(context),
                              icon: const Icon(
                                Icons.shopping_cart_outlined,
                                color: Colors.white,
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
