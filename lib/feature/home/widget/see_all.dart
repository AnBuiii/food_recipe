import 'package:flutter/material.dart';
import 'package:food_recipe/utils/colors.dart';

import '../../../utils/typo.dart';

class SeeAllButton extends StatelessWidget {
  const SeeAllButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "See all",
          style: label_bold.copyWith(color: primaryColor),
        ),
        const SizedBox(
          width: 4,
        ),
        const Icon(
          Icons.arrow_forward,
          color: primaryColor,
        )
      ],
    );
  }
}
