import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe/data/meals.dart';
import 'package:food_recipe/feature/recipe_detail/widget/IngredientWidget.dart';
import 'package:food_recipe/feature/recipe_detail/widget/information_section.dart';
import 'package:food_recipe/utils/colors.dart';
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
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, right: 20, bottom: 12),
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
                InformationSection(recipe: recipe),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Ingredients", style: h5),
                      Text(
                        "${ingredientCount(recipe)} items",
                        style: label_regular.copyWith(color: neutral40),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (ctx, idx) => Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                child: SizedBox(
                  width: double.infinity,
                  child: IngredientWidget(
                    title: switch (idx) {
                          0 => recipe.strIngredient1,
                          1 => recipe.strIngredient2,
                          2 => recipe.strIngredient3,
                          3 => recipe.strIngredient4,
                          4 => recipe.strIngredient5,
                          int() => "",
                        } ??
                        "",
                  ),
                ),
              ),
              childCount: ingredientCount(recipe),
            ),
          ),
        ],
      ),
    );
  }
}
