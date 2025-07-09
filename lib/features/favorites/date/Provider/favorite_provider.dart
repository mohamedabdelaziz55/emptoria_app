import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../home/data/models/productModel/product_model.dart';

class FavoriteProvider extends ChangeNotifier {
  final List<String> _favorites = [];

  List<String> get favorites => _favorites;

  void toggleFavorite(ProductModel product) {
    if (_favorites.contains(product.id)) {
      _favorites.remove(product.id);
    } else {
      _favorites.add(product.id);
    }
    _saveFavoritesToPrefs();
    notifyListeners();
  }

  bool isExist(ProductModel product) {
    return _favorites.contains(product.id);
  }

  static FavoriteProvider of(BuildContext context, {bool listen = true}) {
    return Provider.of<FavoriteProvider>(context, listen: listen);
  }

  Future<void> loadFavoritesFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final storedFavorites = prefs.getStringList('favorites_ids');
    if (storedFavorites != null) {
      _favorites.clear();
      _favorites.addAll(storedFavorites);
      notifyListeners();
    }
  }

  Future<void> _saveFavoritesToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('favorites_ids', _favorites);
  }

  Future<void> clearFavorites() async {
    _favorites.clear();
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('favorites_ids');
    notifyListeners();
  }
}
