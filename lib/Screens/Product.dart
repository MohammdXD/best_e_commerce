import 'dart:convert';
import 'dart:ui';
import 'package:best_e_commerce/Module/Proudect_API.dart';
import 'package:best_e_commerce/Provider/language_provider.dart';
import 'package:best_e_commerce/Widgets/list_forYou_product.dart';
import 'package:best_e_commerce/Widgets/menu_item.dart';
import 'package:best_e_commerce/Widgets/product_card.dart';
import 'package:best_e_commerce/generated/l10n.dart';
import 'package:best_e_commerce/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:best_e_commerce/Service/Api.dart';
import 'package:provider/provider.dart';

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

  late final List<Map<String, dynamic>> bannerItems = [
    {
      'image': 'assets/images/Image Banner 2.png',
      'name': S.of(context).smartphone,
      'brandNumber': S.of(context).brands1,
    },
    {
      'image': 'assets/images/Image Banner 3.png',
      'name': S.of(context).fashion,
      'brandNumber': S.of(context).brands2,
    },
  ];

  late final List<Map<String, dynamic>> menuItems = [
    {'icon': 'assets/icons/Flash Icon.svg', 'label': S.of(context).flash},
    {'icon': 'assets/icons/Bill Icon.svg', 'label': S.of(context).bill},
    {'icon': 'assets/icons/Game Icon.svg', 'label': S.of(context).games},
    {'icon': 'assets/icons/Gift Icon.svg', 'label': S.of(context).daily},
    {'icon': 'assets/icons/Discover.svg', 'label': S.of(context).more},
  ];

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    final isArabic = languageProvider.isArabic;
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
                padding: EdgeInsets.fromLTRB(10, 19, 0, 10),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    hintText: S.of(context).searchProducts,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                      gapPadding: 10,
                    ),
                    prefixIcon: Icon(Icons.search),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 10,
                    ),
                  ),
                ),
              ),
              actions: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 6, 0, 0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: SvgPicture.asset('assets/icons/Cart Icon.svg'),
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.cart);
                      },
                    ),
                  ),
                ),
                SizedBox(width: 15),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 6, 2, 0),
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
                SizedBox(width: 25),
              ],
            ),

            SliverList(
              delegate: SliverChildListDelegate([
                Column(
                  children: [
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.only(left: 0),
                      child: Container(
                        width: 340,
                        height: 120,
                        decoration: BoxDecoration(
                          color: Color(0xFF4b3298),
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(25),
                        ),

                        child: Padding(
                          padding: isArabic
                              ? EdgeInsets.only(left: 150, top: 20)
                              : EdgeInsets.only(right: 150, top: 20),
                          child: Column(
                            children: [
                              Padding(
                                padding: isArabic
                                    ? EdgeInsets.only(left: 60)
                                    : EdgeInsets.only(right: 0),
                                child: Text(
                                  S.of(context).aSummerSurprise,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                S.of(context).cashback20,
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

                    SizedBox(height: 20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: menuItems.map((item) {
                        return MenuItem(
                          iconPath: item['icon'],
                          title: item['label'],
                        );
                      }).toList(),
                    ),

                    SizedBox(height: 20),

                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          child: Text(
                            S.of(context).specialForYou,
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          child: InkWell(
                            onTap: () {},
                            child: Text(
                              S.of(context).seeMore,
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
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        height: 150,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: bannerItems.length,
                          itemBuilder: (context, index) {
                            return Productlist(
                              name: bannerItems[index]['name'],
                              brand: bannerItems[index]['brandNumber'],
                              image: bannerItems[index]['image'],
                            );
                          },
                        ),
                      ),
                    ),

                    SizedBox(height: 20),

                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          child: Text(
                            S.of(context).popularProducts,
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          child: InkWell(
                            onTap: () {},
                            child: Text(
                              S.of(context).seeMore,
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
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        height: 316,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: products.length,
                          itemBuilder: (context, index) {
                            return ProductCard(product: products[index]);
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
