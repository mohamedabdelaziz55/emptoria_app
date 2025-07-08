import 'package:emptoria_app_team/features/cart/presentation/data/cart_provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/custom_snack_bar.dart';
import '../../../data/models/productModel/product_model.dart';

class CustomButtonAddCart extends StatefulWidget {
  const CustomButtonAddCart({super.key, required this.product});

  final ProductModel product;

  @override
  State<CustomButtonAddCart> createState() => _CustomButtonAddCartState();
}

class _CustomButtonAddCartState extends State<CustomButtonAddCart> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final isInCart = cartProvider.isExist(widget.product);

    return SizedBox(
      height: 40,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          cartProvider.toggleCart(widget.product);

          CustomSnackBar.show(
            context,
            message: isInCart
                ? "Product removed from cart"
                : "Product added to cart",
            backgroundColor: isInCart ? Colors.redAccent : Colors.green,
            icon: Icons.shopping_cart_outlined,
          );

          // Refresh button appearance
          setState(() {});
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
