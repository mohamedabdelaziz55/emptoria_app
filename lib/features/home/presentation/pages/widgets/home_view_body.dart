import 'dart:async';

import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'custom_app_bar.dart';
import 'custom_sections.dart';
import 'grid_view_cate.dart';
import 'list_view_offer_card.dart';
import 'list_view_product_card.dart';
import 'row_text_and_view.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  bool loading = false;
  @override
  void initState() {
    loading=true;
    Timer(Duration(seconds: 3),(){
      setState(() {
        loading =false;
      });
    });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Skeletonizer(
        enabled: loading,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SizedBox(height: 20),
            CustomAppBar(),
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
