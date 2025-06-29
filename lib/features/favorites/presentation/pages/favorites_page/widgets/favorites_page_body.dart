import 'package:flutter/cupertino.dart';

import '../../../../../categories/presentation/pages/widgets/custom_cate_appbar.dart';
import '../../../../../home/data/models/productModel/product_model.dart';

class FavoritesPageBody extends StatelessWidget {
  const FavoritesPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomCateAppBar(title: 'Favorites',showRow: false,),
        ],
      ),
    );
  }
}
class FavoriteProvider extends ChangeNotifier {
  final List<ProductModel> _favorites = [];

  List<ProductModel> get favorites => _favorites;

  void toggleFavorite(ProductModel product) {
    if (_favorites.contains(product)) {
      _favorites.remove(product);
    } else {
      _favorites.add(product);
    }
    notifyListeners();
  }

  bool isFavorite(ProductModel product) {
    return _favorites.contains(product);
  }
}