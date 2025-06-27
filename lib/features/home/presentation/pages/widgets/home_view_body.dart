import 'package:emptoria_app_team/features/home/data/models/home_model/sections_model.dart';
import 'package:emptoria_app_team/features/home/presentation/pages/widgets/row_text_and_view.dart';
import 'package:flutter/material.dart';
import 'custom_app_bar.dart';
import 'custom_sections.dart';
import 'list_view_offer_card.dart';
import 'list_view_product_card.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(),
              PageViewOfferCard(),
              CustomSections(),
              RowTextandView(text1: 'RECOMMENDED', text2: 'FOR YOU',),
              ListViewProductCard(),
              RowTextandView(text1: 'Electronics', text2: 'FOR YOU',),

              RowTextandView(text1: 'BEST', text2: 'SELLERS',),
              ListViewProductCard(),

            ],
          ),
        ),
      ),
    );
  }
}
// class CustomCate extends StatelessWidget {
//   const CustomCate({super.key, required this.item});
// final itemModel item;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Image.asset("")
//       ],
//     )
//       ;
//   }
// }


