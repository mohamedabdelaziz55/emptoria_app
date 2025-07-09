import 'dart:async';
import 'package:emptoria_app_team/features/favorites/presentation/pages/favorites_page/widgets/product_card_grid%20.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:emptoria_app_team/features/favorites/presentation/pages/favorites_page/no_favorites.dart';
import '../../../../../categories/presentation/pages/widgets/custom_cate_appbar.dart';
import 'package:emptoria_app_team/features/favorites/date/Provider/favorite_provider.dart';
import '../../../../../home/data/data/dummy_data.dart';
import '../../../../../home/data/models/productModel/product_model.dart';

class FavoritesPageBody extends StatefulWidget {
  const FavoritesPageBody({super.key});

  @override
  State<FavoritesPageBody> createState() => _FavoritesPageBodyState();
}

class _FavoritesPageBodyState extends State<FavoritesPageBody> {
  bool loading = true;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      FavoriteProvider.of(context, listen: false).loadFavoritesFromPrefs();
    });

    Timer(const Duration(seconds: 3), () {
      setState(() {
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    final List<ProductModel> finalList = provider.favorites
        .map((id) => getProductById(id))
        .toList();

    return finalList.isNotEmpty
        ? SingleChildScrollView(
      child: Column(
        children: [
          const CustomCateAppBar(title: 'Favorites', showRow: false),
          Skeletonizer(
            enabled: loading,
            child: ProductCardGrid(finalList: finalList),
          ),
        ],
      ),
    )
        : const NoFavorites();
  }

  ProductModel getProductById(String id) {
    return dummyData.firstWhere((product) => product.id == id);
  }
}
