import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';




class LoginButton extends StatefulWidget {
  final double? width;
  final double? height;
  final String? text;
  final String? image;
  final VoidCallback? onTap;
  const LoginButton(
      {this.image,
      super.key, required this.width, required this.height, required this.text, required this.onTap});

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.width,
        height: widget.height,
      decoration: BoxDecoration(
          color: AppColors.mainColor,
          borderRadius: BorderRadius.circular(16)
      ),
      child: InkWell(
        onTap: widget.onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
          widget.text!,
              style: TextStyle(fontSize: 16,color: AppColors.white,fontWeight: FontWeight.bold),
            ),
            if(widget.image != null)
            Image.asset('${widget.image}',height: 20,width: 20,)
          ],
        ),

      ),
    );
  }
}
