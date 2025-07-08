import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../home/data/models/productModel/product_model.dart';

class CartProvider extends ChangeNotifier {
  final List<String> _cartItems = [];

  List<String> get cart=> _cartItems;

  void toggleCart(ProductModel product) {
    if (_cartItems.contains(product.id)) {
      _cartItems.remove(product.id);
    } else {
      _cartItems.add(product.id);
    }
    _saveCartToPrefs();
    notifyListeners();
  }

  bool isExist(ProductModel product) {
    return _cartItems.contains(product.id);
  }

  Future<void> loadCartFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final stored = prefs.getStringList('cart_ids');
    if (stored != null) {
      _cartItems.clear();
      _cartItems.addAll(stored);
      notifyListeners();
    }
  }

  Future<void> _saveCartToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('cart_ids', _cartItems);
  }

  Future<void> clearCart() async {
    _cartItems.clear();
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('cart_ids');
    notifyListeners();
  }

  static CartProvider of(BuildContext context, {bool listen = true}) {
    return Provider.of<CartProvider>(context, listen: listen);
  }
}

