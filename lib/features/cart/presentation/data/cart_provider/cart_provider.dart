import 'package:emptoria_app_team/features/home/data/models/productModel/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class CartProvider extends ChangeNotifier {
  final List<String> _cart = [];

  List<String> get cart => _cart;

  void toggleCart(ProductModel product) {
    if (_cart.contains(product.id)) {
      _cart.remove(product.id);
    } else {
      _cart.add(product.id);
    }
    notifyListeners();
  }

  bool isExist(ProductModel product) {
    return _cart.contains(product.id);
  }

  static CartProvider of(BuildContext context, {bool listen = true}) {
    return Provider.of<CartProvider>(context, listen: listen);
  }
}
