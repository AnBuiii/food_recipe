import 'package:flutter/material.dart';
import 'package:food_recipe/utils/colors.dart';

class CreateInfoWidget extends StatelessWidget {
  const CreateInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      decoration: BoxDecoration(
          color: neutral10,
          borderRadius: BorderRadius.circular(10)),
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
          const Row(
            children: [
              Text("01"),
              Icon(Icons.arrow_forward_sharp)
            ],
          )
        ],
      ),
    );
  }
}
