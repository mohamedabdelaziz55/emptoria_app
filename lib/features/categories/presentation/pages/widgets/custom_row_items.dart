import 'package:flutter/material.dart';

import '../../../../../core/styles.dart';

class CustomRowItems extends StatelessWidget {
  const CustomRowItems({super.key, required this.items});
final int items;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(22.0),
      child: Row(
        children: [
          Text("$items items", style: Styles.textStyle20bold),
          Spacer(flex: 1,),
          CustomCardRow(text: 'Sort', icon: Icons.swap_vert),
          CustomCardRow(text: 'Filter', icon: Icons.filter_alt_outlined),
        ],
      ),
    );
  }
}

class CustomCardRow extends StatelessWidget {
  const CustomCardRow({super.key, required this.text, required this.icon});

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.03,
      width: MediaQuery.of(context).size.width * 0.15,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text(text), Icon(icon)],
      ),
    );
  }
}
