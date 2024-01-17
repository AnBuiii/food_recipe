import 'package:flutter/material.dart';
import 'package:food_recipe/utils/colors.dart';
import 'package:food_recipe/utils/typo.dart';

class BigButton extends StatelessWidget {
  final Function() onClick;

  const BigButton({super.key, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 209,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
      decoration: BoxDecoration(
          color: primaryColor, borderRadius: BorderRadius.circular(10)),
      child: GestureDetector(
        onTap: onClick,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Start cooking",
              style: bodyLarge.copyWith(color: Colors.white),
            ),
            const Icon(
              Icons.arrow_forward_sharp,
              color: Colors.white,
              size: 20,
            )
          ],
        ),
      ),
    );
  }
}
