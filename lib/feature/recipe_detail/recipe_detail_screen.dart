import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe/feature/recipe_detail/IngredientWidget.dart';
import 'package:food_recipe/utils/colors.dart';
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      "assets/recipe.png",
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.orange,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      const Text(
                        "4,5",
                        style: label_bold,
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      Text(
                        "(300 Reviews)",
                        style: label_regular.copyWith(color: neutral40),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "assets/person.png",
                            width: 41,
                            height: 41,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Roberta Anny",
                                style: paragraph_bold,
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.location_on,
                                    size: 16,
                                    color: primaryColor,
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    "Bali, Indonesia",
                                    style: label_regular.copyWith(
                                        color: neutral40),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                      Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            "Follow",
                            style: label_bold.copyWith(color: Colors.white),
                          ))
                    ],
                  ),
                ],
              ),
            ),

            Padding(
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
                  const SizedBox(height: 16,),
                  ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (ctx, idx) {
                        return const IngredientWidget();
                      },
                      separatorBuilder: (ctx, idx) {
                        return const SizedBox(
                          height: 12,
                        );
                      },
                      itemCount: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
