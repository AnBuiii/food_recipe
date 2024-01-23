import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe/data/meals.dart';
import 'package:food_recipe/feature/recipe_detail/widget/IngredientSection.dart';
import 'package:food_recipe/feature/recipe_detail/widget/information_section.dart';
import 'package:food_recipe/utils/typo.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class RecipeDetailScreen extends ConsumerWidget {
  final Meals recipe;

  const RecipeDetailScreen({super.key, required this.recipe});

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
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 12),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      recipe.strMeal ?? "",
                      style: h4_bold,
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            ),

            // Information
            InformationSection(
              recipe: recipe,
            ),

            IngredientSection(
              recipe: recipe,
            )
          ],
        ),
      ),
    );
  }
}
