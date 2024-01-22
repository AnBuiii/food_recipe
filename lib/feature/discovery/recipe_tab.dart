import 'package:flutter/material.dart';
import 'package:food_recipe/database/saved_recipe_notifier.dart';
import 'package:food_recipe/utils/widgets/recipe_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RecipeTab extends ConsumerWidget {
  const RecipeTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipes = ref.watch(savedRecipeProvider);
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      shrinkWrap: true,
      itemBuilder: (ctx, idx) {
        return SizedBox(
            width: double.infinity,
            height: 200,
            child: RecipeWidget(recipes[idx]));
      },
      separatorBuilder: (ctx, idx) {
        return const SizedBox(
          height: 20,
        );
      },
      itemCount: recipes.length,
    );
  }
}
