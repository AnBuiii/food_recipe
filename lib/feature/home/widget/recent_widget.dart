import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe/data/meals.dart';
import 'package:food_recipe/utils/colors.dart';
import 'package:food_recipe/utils/route/app_router.dart';
import 'package:food_recipe/utils/typo.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RecentWidget extends ConsumerWidget {
  final Meals recipe;

  const RecentWidget({
    super.key,
    required this.recipe,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        context.router.push(RecipeDetailRoute(recipe: recipe));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 124,
            height: 124,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                recipe.strMealThumb ?? "",
                fit: BoxFit.fill,
              ),
            ),
          ),
          Text(
            (recipe.strMeal) ?? "",
            style: label_bold,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            "By Adrianna Curl",
            style: tiny_regular.copyWith(color: neutral40),
          )
        ],
      ),
    );
  }
}
