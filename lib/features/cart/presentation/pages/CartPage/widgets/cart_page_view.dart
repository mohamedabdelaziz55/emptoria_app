import 'package:emptoria_app_team/features/home/data/models/productModel/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../categories/presentation/pages/widgets/custom_cate_appbar.dart';
import '../../../../../favorites/presentation/pages/favorites_page/widgets/product_card_grid .dart';
import '../../../../../home/data/data/dummy_data.dart';
import '../../../river_pod/cart_river_pod.dart';

class CartPageView extends ConsumerStatefulWidget {
  const CartPageView({super.key});

  @override
  ConsumerState<CartPageView> createState() => _CartPageViewState();
}

class _CartPageViewState extends ConsumerState<CartPageView> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(cartProvider.notifier).loadCartFromPrefs();
    });
  }

  @override
  Widget build(BuildContext context) {
    final cart = ref.watch(cartProvider);

    final List<ProductModel> finalList =
    cart.map((id) => getProductById(id)).toList();

    return Column(
      children: [
        const CustomCateAppBar(title: 'Cart', showRow: false),
        ProductCardGrid(finalList: finalList),
      ],
    );
  }

  ProductModel getProductById(String id) {
    return dummyData.firstWhere((product) => product.id == id);
  }
}
