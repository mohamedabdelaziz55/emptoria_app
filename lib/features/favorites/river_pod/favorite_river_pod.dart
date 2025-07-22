import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../home/data/models/productModel/product_model.dart';

final favoriteProvider =
StateNotifierProvider<FavoriteNotifier, List<String>>(
      (ref) => FavoriteNotifier(),
);

class FavoriteNotifier extends StateNotifier<List<String>> {
  FavoriteNotifier() : super([]) {
    loadFavoritesFromPrefs();
  }

  Future<void> toggleFavorite(ProductModel product) async {
    final id = product.id;
    if (state.contains(id)) {
      state = [...state]..remove(id);
    } else {
      state = [...state, id];
    }
    await _saveFavoritesToPrefs();
  }

  bool isExist(ProductModel product) {
    return state.contains(product.id);
  }

  Future<void> loadFavoritesFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final storedFavorites = prefs.getStringList('favorites_ids');
    if (storedFavorites != null) {
      state = storedFavorites;
    }
  }

  Future<void> _saveFavoritesToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('favorites_ids', state);
  }

  Future<void> clearFavorites() async {
    state = [];
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('favorites_ids');
  }
}
