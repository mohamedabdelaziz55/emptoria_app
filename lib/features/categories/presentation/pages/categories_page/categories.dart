


import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import '../../../../home/data/models/productModel/product_model.dart';
import '../widgets/categories_page_body.dart';

@RoutePage()
class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key, required this.filteredProduct, required this.title});
  final List<ProductModel> filteredProduct;
  final String title;
  @override
  Widget build(BuildContext context) {
    return CategoriesPageBody(filteredProduct: filteredProduct, title: title,);
  }
}
