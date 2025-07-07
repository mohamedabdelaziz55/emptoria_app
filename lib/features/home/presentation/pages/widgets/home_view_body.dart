import 'package:emptoria_app_team/utils/app_colors.dart';
import 'package:flutter/material.dart';
import '../../../../../core/assets.dart';
import '../../../../../core/styles.dart';
import 'custom_app_bar.dart';
import 'custom_sections.dart';
import 'grid_view_cate.dart';
import 'list_view_offer_card.dart';
import 'list_view_product_card.dart';
import 'row_text_and_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Stack(
        children: [
          const SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  SizedBox(height: 70,),
                  PageViewOfferCard(),
              CustomSections(),
              RowTextandView(text1: 'RECOMMENDED', text2: 'FOR YOU'),
              ListViewProductCard(),
              RowTextandView(text1: 'Electronics', text2: 'FOR YOU'),
              GridViewCate(),
              RowTextandView(text1: 'BEST', text2: 'SELLERS'),
              ListViewProductCard(),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              color: AppColors.white,
                width: double.infinity,
                child: const CustomAppBar()),
          ),
        ],
      ),
    );
  }
}

class ScerchPage extends StatelessWidget {
  const ScerchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("ScerchPage"));
  }
}

class FavPage extends StatelessWidget {
  const FavPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("FavPage"));
  }
}

class CartPAge extends StatelessWidget {
  const CartPAge({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("CartPAge"));
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("ProfilePage"));
  }
}
