import 'package:flutter/material.dart';
import 'package:food_recipe/database/saved_recipe_notifier.dart';
import 'package:food_recipe/utils/colors.dart';
import 'package:food_recipe/utils/typo.dart';
import 'package:food_recipe/utils/widgets/recipe_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class IngredientSection extends ConsumerWidget {
  const IngredientSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipes = ref.watch(savedRecipeProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Ingredients", style: h5),
              Text(
                "5 items",
                style: label_regular.copyWith(color: neutral40),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          ListView.separated(
              shrinkWrap: true,
              // TODO
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (ctx, idx) {
                return SizedBox(
                    width: double.infinity,
                    height: 200,
                    child: RecipeWidget(recipes[idx]));
              },
              separatorBuilder: (ctx, idx) {
                return const SizedBox(
                  height: 12,
                );
              },
              itemCount: recipes.length),
        ],
      ),
    );
  }
}
