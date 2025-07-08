import 'package:flutter/material.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/utils/styles.dart';

class RowTextandView extends StatelessWidget {
  const RowTextandView({
    super.key, required this.text1, required this.text2,
  });
final String text1;
final String text2;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text("$text1 ", style: Styles.textStyle18bold),
              Text(
                text2,
                style: Styles.textStyle18bold.copyWith(color: kPC),
              ),
            ],
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              "View All",
              style: TextStyle(
                decoration: TextDecoration.underline,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

