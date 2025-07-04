
import 'package:flutter/material.dart';

class CustomButtonAddCart extends StatelessWidget {
  const CustomButtonAddCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(vertical: 10),
        ),
        onPressed: () {},
        child: const Text(
          "Add to cart",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}