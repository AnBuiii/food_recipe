import 'package:flutter/material.dart';
import 'package:food_recipe/feature/home/widget/see_all.dart';
import 'package:food_recipe/utils/typo.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: h5),
          const SeeAllButton()
        ],
      ),
    );
  }
}
