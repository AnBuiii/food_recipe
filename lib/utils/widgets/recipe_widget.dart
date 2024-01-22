import 'package:flutter/material.dart';
import 'package:food_recipe/data/meals.dart';
import 'package:food_recipe/utils/colors.dart';
import 'package:food_recipe/utils/typo.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RecipeWidget extends ConsumerWidget {
  final Meals recipe;

  const RecipeWidget(this.recipe, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      fit: StackFit.expand,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            recipe.strMealThumb ?? "",
            fit: BoxFit.cover,
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            margin: const EdgeInsets.only(left: 8, top: 8),
            decoration: BoxDecoration(
              color: const Color(0x3030304d),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Wrap(
              direction: Axis.horizontal,
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  "4,5",
                  style: label_bold.copyWith(color: Colors.white),
                )
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 16, bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  recipe.strMeal ?? "",
                  style: paragraph_bold.copyWith(color: Colors.white),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(
                  height: 8,
                ),
                IntrinsicHeight(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "${ingredientCount(recipe)} Ingredients",
                        style: small_regular.copyWith(color: Colors.white),
                      ),
                      // Divider(),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: VerticalDivider(
                          color: Colors.white,
                          thickness: 1,
                        ),
                      ),
                      Text(
                        "40 min",
                        style: small_regular.copyWith(color: Colors.white),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            margin: const EdgeInsets.only(top: 8, right: 8),
            width: 32,
            height: 32,
            decoration: const BoxDecoration(
                color: Colors.white, shape: BoxShape.circle),
            child: const Icon(
              Icons.more_horiz,
              color: primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
