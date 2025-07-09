import 'package:auto_route/annotations.dart';
import 'package:emptoria_app_team/features/cart/presentation/pages/CartPage/widgets/cart_page_view.dart';
import 'package:flutter/material.dart';


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
