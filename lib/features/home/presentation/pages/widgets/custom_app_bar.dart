import 'package:flutter/material.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(child: IconAppBar(icon: Icons.notifications_none,)),
          Row(
            children: [
              Text("E", style: Styles.textStyle30bold),
              Text(
                "mptoria",
                style: Styles.textStyle24bold.copyWith(
                  color: Color(0xff008CFF),
                ),
              ),
            ],
          ),
          Image.asset(AssetsData.logo),
        ],
      ),
    );
  }
}

class IconAppBar extends StatelessWidget {
  const IconAppBar({super.key, required this.icon, });

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final double h = MediaQuery.of(context).size.height;
    final double w = MediaQuery.of(context).size.width;
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Container(
        height: h * 0.05,
        width: w * 0.11,
        color: Color(0xffF2F2F2),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Icon(icon, size: 30, color: Colors.black),
        ),
      ),
    );
  }
}
