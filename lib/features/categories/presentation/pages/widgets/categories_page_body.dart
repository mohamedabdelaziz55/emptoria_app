import 'package:emptoria_app_team/features/categories/presentation/pages/widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';
import '../../../../home/presentation/pages/widgets/product_card.dart';
import 'custom_cate_appbar.dart';
import 'custom_row_items.dart';

class CategoriesPageBody extends StatelessWidget {
  const CategoriesPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomCateAppBar(title: 'Womans'),
              SearchBarWidget(),
              CustomRowItems(),
              CustomGridViewCardCate()
            ],
          ),
        ),
      ),
    );
  }
}

class CustomGridViewCardCate extends StatelessWidget {
  const CustomGridViewCardCate({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 10,
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
        return const ProductCard();    
      },
    );
  }
}