import 'package:flutter/material.dart';
import 'package:food_recipe/utils/colors.dart';

class IngredientWidget extends StatelessWidget {
  const IngredientWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: neutral10,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 52,
                  width: 52,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Image.asset("assets/noodle.png"),
                ),
                const Text("Bread")
              ],
            ),
            const Text("200g")
          ],
        ),
      ),
    );
  }
}
