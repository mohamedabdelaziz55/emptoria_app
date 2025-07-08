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
  late bool isInCart;

  @override
  void initState() {
    super.initState();
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    isInCart = cartProvider.isExist(widget.product);
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return SizedBox(
      height: 40,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          cartProvider.toggleCart(widget.product);
          final nowInCart = cartProvider.isExist(widget.product);

          CustomSnackBar.show(
            context,
            message: nowInCart
                ? "Product added to cart"
                : "Product removed from cart",
            backgroundColor: nowInCart ? Colors.green : Colors.redAccent,
            icon: Icons.shopping_cart_outlined,
          );

          setState(() {
            isInCart = nowInCart;
          });
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
