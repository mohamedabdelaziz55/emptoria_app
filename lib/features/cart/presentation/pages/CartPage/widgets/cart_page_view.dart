import 'package:emptoria_app_team/features/cart/presentation/data/cart_provider/cart_provider.dart';
import 'package:emptoria_app_team/features/home/data/models/productModel/product_model.dart';
import 'package:flutter/material.dart';


import '../../../../../categories/presentation/pages/widgets/custom_cate_appbar.dart';
import '../../../../../favorites/presentation/pages/favorites_page/widgets/product_card_grid .dart';
import '../../../../../home/data/data/dummy_data.dart';

class CartPageView extends StatefulWidget {
  const CartPageView({super.key});

  @override
  State<CartPageView> createState() => _CartPageViewState();
}

class _CartPageViewState extends State<CartPageView> {
  @override
  void initState() {
    super.initState();

    CartProvider.of(context, listen: false).loadCartFromPrefs().then((_) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final cart = CartProvider.of(context);
    final List<ProductModel> finalList =
    cart.cart.map((id) => getProductById(id)).toList();

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
