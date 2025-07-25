

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../Product Details/data/data/dummy_data.dart';
import '../../../categories/presentation/pages/widgets/custom_cate_appbar.dart';
import '../../../home/data/models/productModel/product_model.dart';
import '../../river_pod/favorite_river_pod.dart';
import '../pages/favorites_page/no_favorites.dart';
import '../pages/favorites_page/widgets/product_card_grid .dart';

class FavoritesPageBody extends ConsumerStatefulWidget {
  const FavoritesPageBody({super.key});

  @override
  ConsumerState<FavoritesPageBody> createState() => _FavoritesPageBodyState();
}

class _FavoritesPageBodyState extends ConsumerState<FavoritesPageBody> {
  bool loading = true;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final favorites = ref.watch(favoriteProvider);

    final List<ProductModel> finalList = favorites
        .map((id) => getProductById(id))
        .whereType<ProductModel>()
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

  ProductModel? getProductById(String id) {
    try {
      return dummyData.firstWhere((product) => product.id == id);
    } catch (e) {
      return null;
    }
  }
}
