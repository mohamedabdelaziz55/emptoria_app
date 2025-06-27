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
              RowTextandView(),
              ListViewProductCard()
            ],
          ),
        ),
      ),
    );
  }
}


