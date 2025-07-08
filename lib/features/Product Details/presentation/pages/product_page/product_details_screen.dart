import 'package:auto_route/auto_route.dart';
import 'package:emptoria_app_team/features/Product%20Details/presentation/pages/widgets/product_details_body.dart';
import 'package:emptoria_app_team/features/home/presentation/pages/widgets/custom_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../home/data/models/productModel/product_model.dart';

@RoutePage()
class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.product});

  final ProductModel product;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions:[Padding(
          padding: const EdgeInsets.only(right: 10),
          child: IconAppBar(icon: Icons.shopping_cart_outlined,),
        )],
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            context.router.pop();
          },
          icon: Icon(CupertinoIcons.back),
        ),
        centerTitle: true,
        title: const Text("Product Details"),
        elevation: 0.2,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 10)],
        ),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {
                },
                icon: const Icon(Icons.shopping_cart_outlined, color: Colors.white),
                label: const Text(
                  "Add To Cart",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.add, color: Colors.blue),
                  onPressed: () {
                    setState(() {
                      quantity++;
                    });
                  },
                ),
                Text(
                  '$quantity',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: Icon(Icons.remove,
                      color: quantity > 1 ? Colors.blue : Colors.grey),
                  onPressed: quantity > 1
                      ? () {
                    setState(() {
                      quantity--;
                    });
                  }
                      : null,
                ),
              ],
            ),
          ],
        ),
      ),
      body: ProductDetailsBody(product: widget.product),
    );
  }
}
