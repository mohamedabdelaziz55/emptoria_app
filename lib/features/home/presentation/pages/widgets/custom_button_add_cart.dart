import 'package:emptoria_app_team/features/cart/presentation/data/cart_provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/utils/custom_snack_bar.dart';
import '../../../data/models/productModel/product_model.dart';

class CustomButtonAddCart extends ConsumerWidget {
  const CustomButtonAddCart({
    super.key,
    required this.product,
    required this.h,
  });

  final ProductModel product;
  final double h;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider);
    final cartNotifier = ref.read(cartProvider.notifier);
    final isInCart = cart.contains(product.id);

    return SizedBox(
      height: h,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () async {
          await cartNotifier.toggleCart(product);
          final nowInCart = cartNotifier.isExist(product);

          CustomSnackBar.show(
            context,
            message: nowInCart
                ? "Product added to cart"
                : "Product removed from cart",
            backgroundColor: nowInCart ? Colors.green : Colors.redAccent,
            icon: Icons.shopping_cart_outlined,
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: isInCart ? Colors.green : Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(vertical: 10),
        ),
        child: Text(
          isInCart ? "Added to Cart" : "Add to Cart",
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
