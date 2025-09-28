import 'package:best_e_commerce/Moudel/Carts_API.dart';
import 'package:best_e_commerce/Moudel/Proudect_API.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartProvider extends ChangeNotifier {
  final List<CartsApi> _cartList = [];
  List<CartsApi> get cartsList => _cartList;

  void toggleCart(CartsApi proudect) {
    if (!isInCart(proudect)) {
      addCart(proudect);
    } else {
      removeCart(proudect);
    }
    notifyListeners();
  }

  void addCart(CartsApi proudect) {
    if (!_cartList.any((item) => item.id == proudect.id)) {
      _cartList.add(proudect);
      notifyListeners();
    }
  }

  void removeCart(CartsApi proudect) {
    _cartList.removeWhere((item) => item.id == proudect.id);
    notifyListeners();
  }

  bool isInCart(CartsApi proudect) {
    return _cartList.any((item) => item.id == proudect.id);
  }

  static CartProvider of(BuildContext context, {bool listen = true}) {
    return Provider.of<CartProvider>(context, listen: listen);
  }
}
