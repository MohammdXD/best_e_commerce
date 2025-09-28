import 'package:best_e_commerce/Moudel/Proudect_API.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteProvider extends ChangeNotifier {
  final List<ProudectApi> _favoriteList = [];
  List<ProudectApi> get favoriteListes => _favoriteList;

  void toggleFavorite(ProudectApi proudect) {
    if (_favoriteList.contains(proudect)) {
      _favoriteList.remove(proudect);
    } else {
      _favoriteList.add(proudect);
    }
    notifyListeners(); // Notify listeners to update the UI
  }

  bool isFavorite(ProudectApi proudect) {
    final isFavorite = _favoriteList.contains(proudect);
    return isFavorite;
  }

  static FavoriteProvider of(BuildContext context, {bool listen = true}) {
    return Provider.of<FavoriteProvider>(context, listen: listen);
  }
}
