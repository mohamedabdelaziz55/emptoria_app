import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../home/data/models/productModel/product_model.dart';

final cartProvider =
StateNotifierProvider<CartNotifier, List<String>>((ref) => CartNotifier());

class CartNotifier extends StateNotifier<List<String>> {
  CartNotifier() : super([]) {
    loadCartFromPrefs();
  }

  Future<void> toggleCart(ProductModel product) async {
    final id = product.id;
    if (state.contains(id)) {
      state = [...state]..remove(id);
    } else {
      state = [...state, id];
    }
    await _saveCartToPrefs();
  }

  bool isExist(ProductModel product) {
    return state.contains(product.id);
  }

  Future<void> loadCartFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final stored = prefs.getStringList('cart_ids');
    if (stored != null) {
      state = stored;
    }
  }

  Future<void> _saveCartToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('cart_ids', state);
  }

  Future<void> clearCart() async {
    state = [];
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('cart_ids');
  }
}
