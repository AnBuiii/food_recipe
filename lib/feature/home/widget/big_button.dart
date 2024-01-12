import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe/utils/colors.dart';
import 'package:food_recipe/utils/typo.dart';

class BigButton extends StatelessWidget {
  final Function() onClick;
  const BigButton({super.key, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      width: 206,
      child: ElevatedButton(
        onPressed: onClick,
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius:
            BorderRadius.circular(10),
          ),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Start Cooking",
              style: bodyLarge,
            ),
            Icon(Icons.arrow_forward)
          ],
        ),
      ),
    );
  }
}
