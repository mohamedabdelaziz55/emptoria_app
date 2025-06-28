


import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import '../widgets/categories_page_body.dart';

@RoutePage()
class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CategoriesPageBody();
  }
}
