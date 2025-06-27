import 'package:flutter/material.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/styles.dart';

class RowTextandView extends StatelessWidget {
  const RowTextandView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text("RECOMMENDED ", style: Styles.textStyle18bold),
              Text(
                "FOR YOU",
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

