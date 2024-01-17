import 'package:flutter/cupertino.dart';
import 'package:food_recipe/utils/colors.dart';
import 'package:food_recipe/utils/typo.dart';

class ProfileWidget extends StatelessWidget {
  final String title;
  final String value;

  const ProfileWidget({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(title, style: small_regular.copyWith(color: neutral40),),
        SizedBox(height: 2,),
        Text(
          value,
          style: h5,
        )
      ],
    );
  }
}
