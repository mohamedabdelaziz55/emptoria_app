import 'package:emptoria_app_team/features/favorites/presentation/pages/favorites_page/widgets/view_fav_card.dart';
import 'package:flutter/material.dart';
import '../../../../../categories/presentation/pages/widgets/custom_cate_appbar.dart';
import 'package:emptoria_app_team/features/favorites/date/Provider/favorite_provider.dart';
import '../../../../../home/data/data/dummy_data.dart';
import '../../../../../home/data/models/productModel/product_model.dart';

class FavoritesPageBody extends StatelessWidget {
  const FavoritesPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    final List<ProductModel> finalList = provider.favorites
        .map((id) => getProductById(id))
        .toList();

    return SingleChildScrollView(
      child: Column(
        children: [
          const CustomCateAppBar(title: 'Favorites', showRow: false),
          ViewFavCard(finalList: finalList),
        ],
      ),
    );
  }

  ProductModel getProductById(String id) {

   return dummyData.firstWhere((product) => product.id == id);
  }
}

