import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
class MyTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final bool obscureText;
  final String hintText;
  final Color fillColor;
  final IconButton? suffixIcon;
  final Icon? prefixIcon;
  final FormFieldValidator<String>? validator;

  const MyTextFormField({
    super.key,
    required this.controller,
    this.obscureText = false,
    required this.hintText,
    required this.fillColor,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
  });

  @override
  State<MyTextFormField> createState() => _MyTextFormFieldState();
}

class _MyTextFormFieldState extends State<MyTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.obscureText,
      decoration: InputDecoration(
        filled: true,
        fillColor: widget.fillColor,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
        hintText: widget.hintText,
        hintStyle: const TextStyle(color: AppColors.gray),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Color(0xFF007BFF)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Color(0xFF007BFF)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Color(0xFF007BFF), width: 2),
        ),
      ),
      validator: widget.validator,
    );
  }
}
