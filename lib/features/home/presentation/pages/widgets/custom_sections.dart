import 'package:auto_route/auto_route.dart';
import 'package:emptoria_app_team/routes/app_route.gr.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../core/styles.dart';
import '../../../data/models/home_model/sections_model.dart';

class CustomSections extends StatelessWidget {
  const CustomSections({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Sections", style: Styles.textStyle20bold),
          const SizedBox(height: 12),
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: sectionsItem.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Section(item: sectionsItem[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


//--------------------------

class Section extends StatelessWidget {
  const Section({super.key, required this.item});

  final itemModel item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        context.router.push(const CategoriesRoute());
      },
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(item.image, height: 80, width: 80, fit: BoxFit.cover),
          ),
          const SizedBox(height: 6),
          Text(item.title),
        ],
      ),
    );
  }
}
