import 'package:best_e_commerce/Moudel/Proudect_API.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteProvider extends ChangeNotifier {
  final List<ProudectApi> _favoriteList = [];
  List<ProudectApi> get favoriteListes => _favoriteList;

  void toggleFavorite(ProudectApi proudect) {
    if (!isFavorite(proudect)) {
      addFavorite(proudect);
    } else {
      removeFavorite(proudect);
    }
    notifyListeners();
  }

  void addFavorite(ProudectApi proudect) {
    if (!_favoriteList.any((item) => item.id == proudect.id)) {
      _favoriteList.add(proudect);
      notifyListeners();
    }
  }

  void removeFavorite(ProudectApi proudect) {
    _favoriteList.removeWhere((item) => item.id == proudect.id);
    notifyListeners();
  }

  bool isFavorite(ProudectApi proudect) {
    return _favoriteList.any((item) => item.id == proudect.id);
  }

  static FavoriteProvider of(BuildContext context, {bool listen = true}) {
    return Provider.of<FavoriteProvider>(context, listen: listen);
  }
}
