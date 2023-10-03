import 'package:flutter/material.dart';

import 'views.dart';

class FoodCategory extends StatelessWidget {
  static const String route = '/food_category_screen';
  const FoodCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 0, right: 0),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              'Food',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Column(
                children: [
                  SizedBox(
                    height: 7,
                  ),
                  Container(
                    height: 60,
                    width: 300,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(0, 3),
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
                                hintStyle:
                                    TextStyle(color: Colors.grey, fontSize: 18),
                                prefixIcon: Container(
                                  padding: EdgeInsets.all(0),
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.search,
                                      color: Colors.grey,
                                    ),
                                    onPressed: () {},
                                  ),
                                  width: 18,
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 21.0),
                            child: Container(
                              height: 160,
                              width: 140,
                              child: GestureDetector(
                                onTap: () => DetailFood.open(context),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.2),
                                          spreadRadius: 1,
                                          blurRadius: 2,
                                          offset: Offset(0, 3),
                                        )
                                      ]),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        flex: 4,
                                        child: Container(
                                          width: double.infinity,
                                          decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      "assets/kategori/ramen.png"),
                                                  fit: BoxFit.cover),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20))),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 1, top: 1),
                                            child: Container(
                                              height: 10,
                                              width: 10,
                                              child: Scaffold(
                                                backgroundColor:
                                                    Colors.transparent,
                                                appBar: AppBar(
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  elevation: 0,
                                                  leading: Icon(null),
                                                  actions: [
                                                    IconButton(
                                                      icon: Image.asset(
                                                        "assets/kategori/love_button.png",
                                                        fit: BoxFit.cover,
                                                      ),
                                                      onPressed: () {},
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                          flex: 2,
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(20),
                                                  bottomRight:
                                                      Radius.circular(20),
                                                )),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10, top: 4, right: 10),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Emi",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  SizedBox(
                                                    height: 3,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Text(
                                                            "4,9",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 11),
                                                          ),
                                                          Icon(
                                                            Icons.star,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    255,
                                                                    122,
                                                                    0),
                                                            size: 11,
                                                          )
                                                        ],
                                                      ),
                                                      Text(
                                                        "Rp.100.000",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(top: 21.0),
                              child: Container(
                                height: 210,
                                width: 140,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        spreadRadius: 1,
                                        blurRadius: 2,
                                        offset: Offset(0, 3),
                                      )
                                    ]),
                                child: Column(
                                  children: [
                                    Expanded(
                                      flex: 5,
                                      child: Container(
                                        width: double.infinity,
                                        decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/kategori/barbeque.png"),
                                              fit: BoxFit.cover),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              right: 1, top: 1),
                                          child: Container(
                                            height: 10,
                                            width: 10,
                                            child: Scaffold(
                                              backgroundColor:
                                                  Colors.transparent,
                                              appBar: AppBar(
                                                backgroundColor:
                                                    Colors.transparent,
                                                elevation: 0,
                                                leading: Icon(null),
                                                actions: [
                                                  IconButton(
                                                    icon: Image.asset(
                                                      "assets/kategori/love_button.png",
                                                      fit: BoxFit.cover,
                                                    ),
                                                    onPressed: () {},
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                        flex: 2,
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(20),
                                                bottomRight:
                                                    Radius.circular(20),
                                              )),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10, top: 8, right: 10),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Sego",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  height: 3,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                          "4,9",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 11),
                                                        ),
                                                        Icon(
                                                          Icons.star,
                                                          color: Color.fromARGB(
                                                              255, 255, 122, 0),
                                                          size: 11,
                                                        )
                                                      ],
                                                    ),
                                                    Text(
                                                      "Rp.80.000",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        )),
                                  ],
                                ),
                              )),
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(top: 21.0),
                              child: Container(
                                height: 210,
                                width: 140,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        spreadRadius: 1,
                                        blurRadius: 2,
                                        offset: Offset(0, 3),
                                      )
                                    ]),
                                child: Column(
                                  children: [
                                    Expanded(
                                      flex: 5,
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/kategori/barbeque.png"),
                                                fit: BoxFit.cover),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20))),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              right: 1, top: 1),
                                          child: Container(
                                            height: 10,
                                            width: 10,
                                            child: Scaffold(
                                              backgroundColor:
                                                  Colors.transparent,
                                              appBar: AppBar(
                                                backgroundColor:
                                                    Colors.transparent,
                                                elevation: 0,
                                                leading: Icon(null),
                                                actions: [
                                                  IconButton(
                                                    icon: Image.asset(
                                                      "assets/kategori/love_button.png",
                                                      fit: BoxFit.cover,
                                                    ),
                                                    onPressed: () {},
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                        flex: 2,
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(20),
                                                bottomRight:
                                                    Radius.circular(20),
                                              )),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10, top: 8, right: 10),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Sego",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  height: 3,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                          "4,9",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 11),
                                                        ),
                                                        Icon(
                                                          Icons.star,
                                                          color: Color.fromARGB(
                                                              255, 255, 122, 0),
                                                          size: 11,
                                                        )
                                                      ],
                                                    ),
                                                    Text(
                                                      "Rp.80.000",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        )),
                                  ],
                                ),
                              )),
                          Padding(
                            padding: const EdgeInsets.only(top: 21.0),
                            child: Container(
                              height: 160,
                              width: 140,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 1,
                                      blurRadius: 2,
                                      offset: Offset(0, 3),
                                    )
                                  ]),
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 4,
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/kategori/ramen.png"),
                                              fit: BoxFit.cover),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20))),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            right: 1, top: 1),
                                        child: Container(
                                          height: 10,
                                          width: 10,
                                          child: Scaffold(
                                            backgroundColor: Colors.transparent,
                                            appBar: AppBar(
                                              backgroundColor:
                                                  Colors.transparent,
                                              elevation: 0,
                                              leading: Icon(null),
                                              actions: [
                                                IconButton(
                                                  icon: Image.asset(
                                                    "assets/kategori/love_button.png",
                                                    fit: BoxFit.cover,
                                                  ),
                                                  onPressed: () {},
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                      flex: 2,
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(20),
                                              bottomRight: Radius.circular(20),
                                            )),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, top: 4, right: 10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Emi",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                height: 3,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
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
                                                  ),
                                                  Text(
                                                    "Rp.100.000",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 21.0),
                            child: Container(
                              height: 160,
                              width: 140,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 1,
                                      blurRadius: 2,
                                      offset: Offset(0, 3),
                                    )
                                  ]),
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 4,
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/kategori/ramen.png"),
                                              fit: BoxFit.cover),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20))),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            right: 1, top: 1),
                                        child: Container(
                                          height: 10,
                                          width: 10,
                                          child: Scaffold(
                                            backgroundColor: Colors.transparent,
                                            appBar: AppBar(
                                              backgroundColor:
                                                  Colors.transparent,
                                              elevation: 0,
                                              leading: Icon(null),
                                              actions: [
                                                IconButton(
                                                  icon: Image.asset(
                                                    "assets/kategori/love_button.png",
                                                    fit: BoxFit.cover,
                                                  ),
                                                  onPressed: () {},
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                      flex: 2,
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(20),
                                              bottomRight: Radius.circular(20),
                                            )),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, top: 4, right: 10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Emi",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                height: 3,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
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
                                                  ),
                                                  Text(
                                                    "Rp.100.000",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(top: 21.0),
                              child: Container(
                                height: 210,
                                width: 140,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        spreadRadius: 1,
                                        blurRadius: 2,
                                        offset: Offset(0, 3),
                                      )
                                    ]),
                                child: Column(
                                  children: [
                                    Expanded(
                                      flex: 5,
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/kategori/barbeque.png"),
                                                fit: BoxFit.cover),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20))),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              right: 1, top: 1),
                                          child: Container(
                                            height: 10,
                                            width: 10,
                                            child: Scaffold(
                                              backgroundColor:
                                                  Colors.transparent,
                                              appBar: AppBar(
                                                backgroundColor:
                                                    Colors.transparent,
                                                elevation: 0,
                                                leading: Icon(null),
                                                actions: [
                                                  IconButton(
                                                    icon: Image.asset(
                                                      "assets/kategori/love_button.png",
                                                      fit: BoxFit.cover,
                                                    ),
                                                    onPressed: () {},
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                        flex: 2,
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(20),
                                                bottomRight:
                                                    Radius.circular(20),
                                              )),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10, top: 8, right: 10),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Sego",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  height: 3,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                          "4,9",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 11),
                                                        ),
                                                        Icon(
                                                          Icons.star,
                                                          color: Color.fromARGB(
                                                              255, 255, 122, 0),
                                                          size: 11,
                                                        )
                                                      ],
                                                    ),
                                                    Text(
                                                      "Rp.80.000",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        )),
                                  ],
                                ),
                              )),
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(top: 21.0),
                              child: Container(
                                height: 210,
                                width: 140,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        spreadRadius: 1,
                                        blurRadius: 2,
                                        offset: Offset(0, 3),
                                      )
                                    ]),
                                child: Column(
                                  children: [
                                    Expanded(
                                      flex: 5,
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/kategori/barbeque.png"),
                                                fit: BoxFit.cover),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20))),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              right: 1, top: 1),
                                          child: Container(
                                            height: 10,
                                            width: 10,
                                            child: Scaffold(
                                              backgroundColor:
                                                  Colors.transparent,
                                              appBar: AppBar(
                                                backgroundColor:
                                                    Colors.transparent,
                                                elevation: 0,
                                                leading: Icon(null),
                                                actions: [
                                                  IconButton(
                                                    icon: Image.asset(
                                                      "assets/kategori/love_button.png",
                                                      fit: BoxFit.cover,
                                                    ),
                                                    onPressed: () {},
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                        flex: 2,
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(20),
                                                bottomRight:
                                                    Radius.circular(20),
                                              )),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10, top: 8, right: 10),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Sego",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  height: 3,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                          "4,9",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 11),
                                                        ),
                                                        Icon(
                                                          Icons.star,
                                                          color: Color.fromARGB(
                                                              255, 255, 122, 0),
                                                          size: 11,
                                                        )
                                                      ],
                                                    ),
                                                    Text(
                                                      "Rp.80.000",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        )),
                                  ],
                                ),
                              )),
                          Padding(
                            padding: const EdgeInsets.only(top: 21.0),
                            child: Container(
                              height: 160,
                              width: 140,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 1,
                                      blurRadius: 2,
                                      offset: Offset(0, 3),
                                    )
                                  ]),
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 4,
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/kategori/ramen.png"),
                                              fit: BoxFit.cover),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20))),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            right: 1, top: 1),
                                        child: Container(
                                          height: 10,
                                          width: 10,
                                          child: Scaffold(
                                            backgroundColor: Colors.transparent,
                                            appBar: AppBar(
                                              backgroundColor:
                                                  Colors.transparent,
                                              elevation: 0,
                                              leading: Icon(null),
                                              actions: [
                                                IconButton(
                                                  icon: Image.asset(
                                                    "assets/kategori/love_button.png",
                                                    fit: BoxFit.cover,
                                                  ),
                                                  onPressed: () {},
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                      flex: 2,
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(20),
                                              bottomRight: Radius.circular(20),
                                            )),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, top: 4, right: 10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Emi",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                height: 3,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
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
                                                  ),
                                                  Text(
                                                    "Rp.100.000",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 100)
                ],
              ),
            ),
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
                              onPressed: () => CategoriesPage.open(context),
                              icon: Icon(
                                Icons.home,
                                color: Colors.white,
                              )),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.search,
                                color: Colors.white,
                              )),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.favorite,
                                color: Colors.white,
                              )),
                          IconButton(
                              onPressed: () => CartScreen.open(context),
                              icon: Icon(
                                Icons.shopping_cart_sharp,
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

  static void open(BuildContext context) => Navigator.pushNamed(context, route);
}
