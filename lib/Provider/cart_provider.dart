import 'package:best_e_commerce/Module/Carts_API.dart';
import 'package:best_e_commerce/Module/Proudect_API.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class CartProvider extends ChangeNotifier {
  final List<CartsApi> _cartList = [];
  List<CartsApi> get cartsList => _cartList;

  int get totalItems => _cartList.fold(0, (sum, item) => sum + item.quantity);

  double get totalPrice => _cartList.fold(
    0,
    (sum, item) => sum + (item.proudect.price * item.quantity),
  );

  CartProvider() {
    _loadCartItems();
  }

  Future<void> _loadCartItems() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final cartData = prefs.getStringList('cart_items');

      if (cartData != null && cartData.isNotEmpty) {
        _cartList.clear();
        for (final itemJson in cartData) {
          try {
            final itemMap = json.decode(itemJson);
            final cartItem = CartsApi.fromJson(itemMap);
            _cartList.add(cartItem);
          } catch (e) {
            print('Error parsing cart item: $e');
          }
        }
        notifyListeners();
      }
    } catch (e) {
      print('Error loading cart items: $e');
    }
  }

  Future<void> _saveCartItems() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final cartData = _cartList
          .map((item) => json.encode(item.toJson()))
          .toList();
      await prefs.setStringList('cart_items', cartData);
    } catch (e) {
      print('Error saving cart items: $e');
    }
  }

  void toggleCart(CartsApi proudect) {
    if (!isInCart(proudect)) {
      addCart(proudect);
    } else {
      removeCart(proudect);
    }
  }

  void addCart(CartsApi proudect) {
    if (!_cartList.any((item) => item.id == proudect.id)) {
      _cartList.add(proudect);
      _saveCartItems();
      notifyListeners();
    }
  }

  void removeCart(CartsApi proudect) {
    _cartList.removeWhere((item) => item.id == proudect.id);
    _saveCartItems();
    notifyListeners();
  }

  void removeCartById(int id) {
    _cartList.removeWhere((item) => item.id == id);
    _saveCartItems();
    notifyListeners();
  }

  void updateQuantity(int id, int newQuantity) {
    final index = _cartList.indexWhere((item) => item.id == id);
    if (index >= 0) {
      _cartList[index] = CartsApi(
        id: _cartList[index].id,
        quantity: newQuantity,
        proudect: _cartList[index].proudect,
      );
      _saveCartItems();
      notifyListeners();
    }
  }

  void addProductToCart(ProudectApi product, {int quantity = 1}) {
    final existingIndex = _cartList.indexWhere(
      (item) => item.proudect.id == product.id,
    );

    if (existingIndex >= 0) {
      _cartList[existingIndex] = CartsApi(
        id: _cartList[existingIndex].id,
        quantity: _cartList[existingIndex].quantity + quantity,
        proudect: product,
      );
    } else {
      final newCartItem = CartsApi(
        id: DateTime.now().millisecondsSinceEpoch,
        quantity: quantity,
        proudect: product,
      );
      _cartList.add(newCartItem);
    }

    _saveCartItems();
    notifyListeners();
  }

  bool isProductInCart(ProudectApi product) {
    return _cartList.any((item) => item.proudect.id == product.id);
  }

  int getProductQuantity(ProudectApi product) {
    final item = _cartList.firstWhere(
      (item) => item.proudect.id == product.id,
      orElse: () => CartsApi(id: -1, quantity: 0, proudect: product),
    );
    return item.quantity;
  }

  CartsApi? getCartItemByProduct(ProudectApi product) {
    try {
      return _cartList.firstWhere((item) => item.proudect.id == product.id);
    } catch (e) {
      return null;
    }
  }

  bool isInCart(CartsApi proudect) {
    return _cartList.any((item) => item.id == proudect.id);
  }

  Future<void> clearCart() async {
    _cartList.clear();
    await _saveCartItems();
    notifyListeners();
  }

  static CartProvider of(BuildContext context, {bool listen = true}) {
    return Provider.of<CartProvider>(context, listen: listen);
  }
}
