import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/home/data/models/productModel/product_model.dart';

class CartHelper {
  static const String _key = 'cart';

  static Future<void> saveToCart(ProductModel product) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> current = prefs.getStringList(_key) ?? [];
    if (!current.any((item) => jsonDecode(item)['id'] == product.id)) {
      current.add(jsonEncode(product.toJson()));
      await prefs.setStringList(_key, current);
    }
  }

  static Future<void> removeFromCart(String productId) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> current = prefs.getStringList(_key) ?? [];

    current.removeWhere((item) => jsonDecode(item)['id'] == productId);
    await prefs.setStringList(_key, current);
  }

  static Future<List<ProductModel>> getCartItems() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> saved = prefs.getStringList(_key) ?? [];
    return saved.map((e) => ProductModel.fromJson(jsonDecode(e))).toList();
  }

  static Future<bool> isInCart(String productId) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> saved = prefs.getStringList(_key) ?? [];
    return saved.any((item) => jsonDecode(item)['id'] == productId);
  }
}