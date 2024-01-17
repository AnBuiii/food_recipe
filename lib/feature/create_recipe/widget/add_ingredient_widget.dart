import 'package:flutter/material.dart';
import 'package:food_recipe/utils/colors.dart';
import 'package:food_recipe/utils/typo.dart';

class AddIngredientWidget extends StatelessWidget {
  final Function() onClick;

  const AddIngredientWidget({super.key, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: neutral20),
            ),
            child: const Text(
              "asd",
              style: label_regular,
            ),
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        Expanded(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: neutral20),
            ),
            child: const Text(
              "asd",
              style: label_regular,
            ),
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black, width: 2)),
          child: const Icon(Icons.remove),
        )
      ],
    );
  }
}
