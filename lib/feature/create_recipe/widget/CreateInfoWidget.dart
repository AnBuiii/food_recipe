import 'package:flutter/material.dart';
import 'package:food_recipe/utils/colors.dart';
import 'package:food_recipe/utils/typo.dart';

class CreateInfoWidget extends StatelessWidget {

  const CreateInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      width: double.infinity,
      decoration: BoxDecoration(
          color: neutral10, borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 36,
                width: 36,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: const Icon(
                  Icons.person,
                  color: primaryColor,
                  size: 20,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              const Text(
                "Bread",
                style: paragraph_bold,
              )
            ],
          ),
          Row(
            children: [
              Text(
                "01",
                style: label_regular.copyWith(color: neutral40),
              ),
              const SizedBox(
                width: 8,
              ),
              const Icon(Icons.arrow_forward_sharp)
            ],
          )
        ],
      ),
    );
  }
}
