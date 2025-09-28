import 'dart:convert';
import 'dart:ui';

import 'package:best_e_commerce/Moudel/Proudect_API.dart';
import 'package:best_e_commerce/Widgets/product_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:best_e_commerce/Serves/Api.dart';

class Product extends StatefulWidget {
  Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  List<ProudectApi> products = [];

  getroducts() async {
    products = await Api.getProducts();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getroducts();
  }

  final List<Map<String, dynamic>> bannerItems = [
    {
      'image': 'assets/images/Image Banner 2.png',
      'name': 'Smartphone',
      'brandNumber': '18 Brands',
    },
    {
      'image': 'assets/images/Image Banner 3.png',
      'name': 'Fashion',
      'brandNumber': '24 Brands',
    },
  ];

  final List<Map<String, dynamic>> menuItems = [
    {'icon': 'assets/icons/Flash Icon.svg', 'label': 'Flash'},
    {'icon': 'assets/icons/Bill Icon.svg', 'label': 'Bill'},
    {'icon': 'assets/icons/Game Icon.svg', 'label': 'Games'},
    {'icon': 'assets/icons/Gift Icon.svg', 'label': 'Daily'},
    {'icon': 'assets/icons/Discover.svg', 'label': 'More'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              floating: true,
              snap: true,
              backgroundColor: Colors.white,
              surfaceTintColor: Colors.white,
              elevation: 0,
              title: Container(
                padding: const EdgeInsets.fromLTRB(10, 19, 0, 10),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    hintText: "Search products",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                      gapPadding: 10,
                    ),
                    prefixIcon: const Icon(Icons.search),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 10,
                    ),
                  ),
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: SvgPicture.asset('assets/icons/Cart Icon.svg'),
                      onPressed: () {},
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 6, 2, 0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: SvgPicture.asset('assets/icons/Bell.svg'),
                      onPressed: () {},
                    ),
                  ),
                ),
                const SizedBox(width: 25),
              ],
            ),

            SliverList(
              delegate: SliverChildListDelegate([
                Column(
                  children: [
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 0),
                      child: Container(
                        width: 340,
                        height: 120,
                        decoration: BoxDecoration(
                          color: Color(0xFF4b3298),
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(25),
                        ),

                        child: Padding(
                          padding: EdgeInsets.only(right: 150, top: 20),
                          child: Column(
                            children: [
                              Text(
                                "A Summer Suprise",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Cashback 20%",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 0, top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildMenuItem(
                            'assets/icons/Flash Icon.svg',
                            "Flash",
                          ),
                          _buildMenuItem('assets/icons/Bill Icon.svg', "Bill"),
                          _buildMenuItem('assets/icons/Game Icon.svg', "Games"),
                          _buildMenuItem('assets/icons/Gift Icon.svg', "Daily"),
                          _buildMenuItem('assets/icons/Discover.svg', "More"),
                        ],
                      ),
                    ),

                    SizedBox(height: 20),

                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Text(
                            "Special for you",
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: InkWell(
                            onTap: () {},
                            child: Text(
                              "See More",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 20),

                    Padding(
                      padding: EdgeInsets.only(left: 30),
                      child: Container(
                        height: 150,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: bannerItems.length,
                          itemBuilder: (context, index) {
                            return _buildProductCard(
                              name: bannerItems[index]['name'],
                              brand: bannerItems[index]['brandNumber'],
                              image: bannerItems[index]['image'],
                            );
                          },
                        ),
                      ),
                    ),

                    SizedBox(height: 20),

                    Padding(
                      padding: EdgeInsets.only(left: 30),
                      child: Container(
                        height: 297,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: products.length,
                          itemBuilder: (context, index) {
                            return ProductListItem(product: products[index]);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildMenuItem(String iconPath, String title) {
  return InkWell(
    onTap: () {},
    borderRadius: BorderRadius.circular(16),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Hero(
            tag: title,
            child: Container(
              width: 52,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.orange.shade50,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: SvgPicture.asset(iconPath, width: 24, height: 24),
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildProductCard({
  required String name,
  required String brand,
  required String image,
}) {
  return SizedBox(
    width: 330,
    height: 150,
    child: Card(
      margin: EdgeInsets.only(right: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Positioned.fill(child: Image.asset(image, fit: BoxFit.cover)),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.black.withOpacity(0.5), Colors.transparent],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 60,
            left: 10,
            right: 16,
            child: Container(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    brand,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
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
