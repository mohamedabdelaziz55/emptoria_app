import 'package:auto_route/auto_route.dart';
import 'package:emptoria_app_team/features/categories/presentation/pages/widgets/search_bar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'custom_cate_appbar.dart';
import 'custom_grid_view_card_cate.dart';
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
              CustomCateAppBar(
                title: 'Womans',
                icon: CupertinoIcons.back,
                onPressed: () {
                  context.router.pop();
                }, showRow: true,
                
              ),
              SearchBarWidget(),
              CustomRowItems(),
              CustomGridViewCardCate(),
            ],
          ),
        ),
      ),
    );
  }
}


