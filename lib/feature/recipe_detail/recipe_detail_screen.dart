import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe/feature/recipe_detail/IngredientSection.dart';
import 'package:food_recipe/feature/recipe_detail/information_section.dart';
import 'package:food_recipe/utils/typo.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class RecipeDetailScreen extends ConsumerWidget {
  const RecipeDetailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20, bottom: 12),
              child: Row(
                children: [
                  Text(
                    "How to make french \ntoast",
                    style: h4_bold,
                  ),
                ],
              ),
            ),

            // Information
            InformationSection(),

            IngredientSection()
          ],
        ),
      ),
    );
  }
}
