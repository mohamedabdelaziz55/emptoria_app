import 'package:emptoria_app_team/core/constants/constants.dart';
import 'package:emptoria_app_team/core/utils/styles.dart';
import 'package:flutter/cupertino.dart';

class NoFavorites extends StatelessWidget {
  const NoFavorites({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Image(image: AssetImage("assets/images/Group.png"))),
        SizedBox(height: 20,),
        Text("Ohhh... Your favorites is empty", style: Styles.textStyle20bold.copyWith(color: kPC),),
        Text("Explore more and shortlist some items."),

      ],
    );
  }
}
