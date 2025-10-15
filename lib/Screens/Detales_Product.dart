import 'package:best_e_commerce/Module/Proudect_API.dart';
import 'package:best_e_commerce/Provider/cart_provider.dart';
import 'package:best_e_commerce/Provider/favorit_provider.dart';
import 'package:best_e_commerce/Provider/language_provider.dart';
import 'package:best_e_commerce/Screens/Product.dart';
import 'package:best_e_commerce/Widgets/color_selector.dart';
import 'package:best_e_commerce/generated/l10n.dart' show S;
import 'package:best_e_commerce/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class Detales_Screen extends StatefulWidget {
  Detales_Screen({super.key, required this.product});

  final ProudectApi product;

  @override
  State<Detales_Screen> createState() => _Detales_ScreenState();
}

class _Detales_ScreenState extends State<Detales_Screen> {
  bool _isDescriptionLong() {
    return widget.product.description.length > 50;
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavoriteProvider>(context);
    final cartProvider = Provider.of<CartProvider>(context);
    final isFavorite = provider.isFavorite(widget.product);
    final isInCart = cartProvider.isProductInCart(widget.product);
    final cartItem = cartProvider.getCartItemByProduct(widget.product);
    final languageProvider = Provider.of<LanguageProvider>(context);
    final isArabic = languageProvider.isArabic;

    final List<Color> availableColors = [
      const Color(0xFFFF6B6B), // red
      const Color(0xFF8C6EFF), // purple
      const Color(0xFFE7C68E), // beige
      const Color(0xFFFFFFFF), // white
    ];

    Color? selectedColor;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        surfaceTintColor: Colors.grey.shade100,
        backgroundColor: Colors.grey.shade100,

        leading: IconButton(
          icon: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Padding(
              padding: isArabic
                  ? EdgeInsets.only(right: 10, top: 5, bottom: 5)
                  : EdgeInsets.only(left: 10, top: 5, bottom: 5),
              child: Icon(Icons.arrow_back_ios),
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),

        actions: [
          Padding(
            padding: isArabic
                ? EdgeInsets.only(left: 20)
                : EdgeInsets.only(right: 20),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 5, bottom: 5),
                child: Row(
                  children: [
                    Padding(
                      padding: isArabic
                          ? EdgeInsets.only(
                              right: 10,
                              left: 5,
                              top: 5,
                              bottom: 5,
                            )
                          : EdgeInsets.only(
                              right: 5,
                              left: 10,
                              top: 5,
                              bottom: 5,
                            ),
                      child: Text(
                        '${widget.product.rate}',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: isArabic
                          ? EdgeInsets.only(left: 5)
                          : EdgeInsets.only(right: 5),
                      child: SvgPicture.asset("assets/icons/Star Icon.svg"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 330,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey.shade100,
                ),
                child: Column(
                  children: [
                    Image.network(
                      widget.product.image,
                      width: 200,
                      height: 250,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),

              SizedBox(height: 20),

              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: Text(
                        widget.product.title,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),

                    Row(
                      children: [
                        Spacer(),
                        Container(
                          width: 70,
                          height: 55,
                          decoration: BoxDecoration(
                            color: Colors.red[50],
                            borderRadius: isArabic
                                ? BorderRadius.only(
                                    topRight: Radius.circular(26),
                                    bottomRight: Radius.circular(26),
                                  )
                                : BorderRadius.only(
                                    topLeft: Radius.circular(26),
                                    bottomLeft: Radius.circular(26),
                                  ),
                          ),
                          child: IconButton(
                            style: IconButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: isArabic
                                    ? BorderRadius.only(
                                        topRight: Radius.circular(26),
                                        bottomRight: Radius.circular(26),
                                      )
                                    : BorderRadius.only(
                                        topLeft: Radius.circular(26),
                                        bottomLeft: Radius.circular(26),
                                      ),
                              ),
                            ),
                            onPressed: () {
                              provider.toggleFavorite(widget.product);
                            },
                            icon: SvgPicture.asset(
                              isFavorite
                                  ? "assets/icons/Heart Icon_2.svg"
                                  : "assets/icons/Heart Icon.svg",
                              color: isFavorite ? Colors.red : Colors.grey,
                              width: 20,
                              height: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: Text(
                        widget.product.description,
                        maxLines: 3,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),

                    if (_isDescriptionLong())
                      Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: TextButton(
                          onPressed: () {
                            _showFullDescription(context, widget.product);
                          },
                          child: Row(
                            children: [
                              Text(
                                S.of(context).seeMoreDetail,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xfffb7a43),
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: Color(0xfffb7a43),
                              ),
                            ],
                          ),
                        ),
                      ),

                    Container(
                      width: double.infinity,
                      height: 170,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(children: []),
                          Spacer(),

                          if (isInCart && cartItem != null) ...[
                            Row(
                              children: [
                                SizedBox(width: 10),
                                ColorSelector(
                                  availableColors: availableColors,
                                  selectedColor: selectedColor,
                                  onColorSelected: (color) {
                                    setState(() {
                                      selectedColor = color;
                                    });
                                  },
                                ),

                                Spacer(),
                                IconButton(
                                  onPressed: () {
                                    final currentQuantity = cartProvider
                                        .getProductQuantity(widget.product);
                                    if (currentQuantity > 1) {
                                      cartProvider.updateQuantity(
                                        cartItem.id,
                                        currentQuantity - 1,
                                      );
                                    } else {
                                      cartProvider.removeCartById(cartItem.id);
                                    }
                                  },
                                  icon: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Icon(
                                      Icons.remove,
                                      color: Color(0xfffb7a43),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20),
                                Text(
                                  '${cartProvider.getProductQuantity(widget.product)}',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 20),
                                IconButton(
                                  onPressed: () {
                                    final currentQuantity = cartProvider
                                        .getProductQuantity(widget.product);
                                    cartProvider.updateQuantity(
                                      cartItem.id,
                                      currentQuantity + 1,
                                    );
                                  },
                                  icon: Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xfffb7a43),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Icon(Icons.add, color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                          ],

                          SizedBox(
                            width: 250,
                            height: 60,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: isInCart
                                    ? Colors.green
                                    : Color(0xfffb7a43),
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              onPressed: () {
                                if (!isInCart) {
                                  cartProvider.addProductToCart(widget.product);
                                  _showAddedToCartSnackbar(
                                    context,
                                    widget.product,
                                  );
                                }
                              },
                              child: Text(
                                isInCart
                                    ? S.of(context).addedToCart
                                    : S.of(context).addToCart,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void _showFullDescription(BuildContext context, ProudectApi product) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) => Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      height: MediaQuery.of(context).size.height * 0.5,
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).productDescription,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              child: Text(
                product.description,
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
            ),
          ),
          SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                S.of(context).close,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Color(0xfffb7a43),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

void _showAddedToCartSnackbar(BuildContext context, ProudectApi product) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('${product.title} ${S.of(context).addedToCart}!'),
      duration: Duration(seconds: 2),
      action: SnackBarAction(
        label: S.of(context).viewCart,
        onPressed: () {
          Navigator.pushNamed(context, Routes.cart);
        },
      ),
    ),
  );
}
