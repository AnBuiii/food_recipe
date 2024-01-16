import 'package:flutter/material.dart';
import 'package:food_recipe/utils/colors.dart';

class AddIngredientWidget extends StatelessWidget {
  const AddIngredientWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: neutral20),
              ),
              child: const Text("asd"),
            ),
          ),
          const SizedBox(width: 12,),
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: neutral20),
              ),
              child: const Text("asd"),
            ),
          ),
          const SizedBox(width: 12,),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black, width: 2)
            ),
            child: const Icon(
                Icons.remove
            ),
          )

        ],
      ),
    );
  }
}
