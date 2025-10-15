import 'package:best_e_commerce/Module/Proudect_API.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class FavoriteProvider with ChangeNotifier {
  List<ProudectApi> _favorites = [];

  List<ProudectApi> get favorites => _favorites;

  static String _favoritesKey = 'favorites';
  late SharedPreferences prefs;

  FavoriteProvider() {
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    try {
      prefs = await SharedPreferences.getInstance();
      final favoritesJson = prefs.getStringList(_favoritesKey);

      if (favoritesJson != null) {
        _favorites = favoritesJson.map((jsonString) {
          final Map<String, dynamic> json = jsonDecode(jsonString);
          return ProudectApi.fromJson(json);
        }).toList();
        notifyListeners();
      }
    } catch (e) {
      print('Error loading favorites: $e');
    }
  }

  Future<void> _saveFavorites() async {
    try {
      prefs = await SharedPreferences.getInstance();
      final favoritesJson = _favorites.map((product) {
        return jsonEncode(product.toJson());
      }).toList();
      await prefs.setStringList(_favoritesKey, favoritesJson);
    } catch (e) {
      print('Error saving favorites: $e');
    }
  }

  Future<void> addToFavorites(ProudectApi product) async {
    if (!_favorites.any((item) => item.id == product.id)) {
      _favorites.add(product);
      notifyListeners();
      await _saveFavorites();
    }
  }

  Future<void> removeFromFavorites(ProudectApi product) async {
    _favorites.removeWhere((item) => item.id == product.id);
    notifyListeners();
    await _saveFavorites();
  }

  Future<void> toggleFavorite(ProudectApi product) async {
    if (isFavorite(product)) {
      await removeFromFavorites(product);
    } else {
      await addToFavorites(product);
    }
  }

  bool isFavorite(ProudectApi product) {
    return _favorites.any((item) => item.id == product.id);
  }

  Future<void> clearFavorites() async {
    _favorites.clear();
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_favoritesKey);
  }
}
