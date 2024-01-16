import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe/feature/recipe_detail/IngredientWidget.dart';
import 'package:food_recipe/utils/colors.dart';
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
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Text("How to make french toast"),
                ],
              ),
            ),
            Image.asset(
              "assets/recipe.png",
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const Row(
              children: [
                Icon(Icons.star),
                Text(" 4,5 "),
                Text("(300 Reviews)")
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset("assets/person.png"),
                      const Column(
                        children: [
                          Text("Roberta Anny"),
                          Row(
                            children: [
                              Icon(Icons.location_on),
                              Text("Bali, Indonesia")
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  TextButton(onPressed: () {}, child: const Text("Follow"))
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Ingredients"),
                  Text("5 items"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (ctx, idx) {
                    return IngredientWidget();
                  },
                  separatorBuilder: (ctx, idx) {
                    return const SizedBox(
                      height: 12,
                    );
                  },
                  itemCount: 10),
            ),
          ],
        ),
      ),
    );
  }
}
