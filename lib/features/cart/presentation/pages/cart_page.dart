import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import '../widgets/cart_page_view.dart';

@RoutePage()

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: CartPageView()),

    );
  }
}
