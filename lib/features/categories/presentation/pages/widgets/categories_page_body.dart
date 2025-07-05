import 'package:auto_route/auto_route.dart';
import 'package:emptoria_app_team/features/categories/presentation/pages/widgets/search_bar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../home/data/data/dummy_data.dart';
import '../../../../home/data/models/productModel/product_model.dart';
import '../../../../home/presentation/pages/widgets/product_card.dart';
import 'custom_cate_appbar.dart';
import 'custom_row_items.dart';

class CategoriesPageBody extends StatelessWidget {
  const CategoriesPageBody({super.key, required this.filteredProduct, required this.title});
  final List<ProductModel> filteredProduct;
  final String title ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomCateAppBar(
                title: title,
                icon: CupertinoIcons.back,
                onPressed: () {
                  context.router.pop();
                }, showRow: true,

              ),
              SearchBarWidget(),
              CustomRowItems(),
              GridView.builder(
                itemCount: filteredProduct.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 2.4 / 4,
                ),
                itemBuilder: (context, index) {
                  return ProductCard(product: filteredProduct[index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}


