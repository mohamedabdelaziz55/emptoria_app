import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../home/data/models/productModel/product_model.dart';

class FavoriteProvider extends ChangeNotifier {
  final List<ProductModel> _fav = [];

  List<ProductModel> get fav => _fav;

  void toggleFavorite(ProductModel product) {
    if (_fav.contains(product)) {
      _fav.remove(product);
    } else {
      _fav.add(product);
    }
    notifyListeners();
  }

  bool isExist(ProductModel product) {
    final isExist = _fav.contains(product);
    return isExist;
  }

  static FavoriteProvider of(context, {bool listen = true}) {
    return Provider.of<FavoriteProvider>(context, listen: listen);
  }
}
