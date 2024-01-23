import 'package:flutter/material.dart';
import 'package:food_recipe/data/meals.dart';
import 'package:food_recipe/feature/recipe_detail/widget/IngredientWidget.dart';
import 'package:food_recipe/utils/colors.dart';
import 'package:food_recipe/utils/typo.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class IngredientSection extends ConsumerWidget {
  final Meals recipe;

  const IngredientSection({super.key, required this.recipe});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print(recipe);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Column(
        children: [

          SliverList(
            delegate: SliverChildBuilderDelegate(
              (ctx, idx) => SizedBox(
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
              childCount: ingredientCount(recipe),
            ),
          ),
          // ListView.separated(
          //   shrinkWrap: true,
          //   physics: const NeverScrollableScrollPhysics(),
          //   itemBuilder: (ctx, idx) {
          //     return
          //   },
          //   separatorBuilder: (ctx, idx) {
          //     return const SizedBox(
          //       height: 12,
          //     );
          //   },
          //   itemCount: ingredientCount(recipe),
          // ),
        ],
      ),
    );
  }
}
