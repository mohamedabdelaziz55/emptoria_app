import 'package:emptoria_app_team/features/cart/presentation/data/cart_provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/custom_snack_bar.dart';
import '../../../data/models/productModel/product_model.dart';
class CustomButtonAddCart extends StatelessWidget {
  const CustomButtonAddCart({
    super.key,
    required this.product,
    required this.h,
  });

  final ProductModel product;
  final double h;

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, cartProvider, _) {
        final isInCart = cartProvider.isExist(product);

        return SizedBox(
          height: h,
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              cartProvider.toggleCart(product);
              final nowInCart = cartProvider.isExist(product);

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
      },
    );
  }
}
