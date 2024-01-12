import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:food_recipe/data/meals.dart';
import 'package:food_recipe/feature/home/provider/recipe_providers.dart';
import 'package:food_recipe/utils/colors.dart';
import 'package:food_recipe/utils/typo.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PopularSection extends HookConsumerWidget {
  final Function(String) onChangeCategory;

  const PopularSection(this.onChangeCategory, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories =
        ["Salad", "Break fast", "Appetizer", "Noodle", "Lunch"].toList();
    final selectedCategory = useState("Break fast");
    final recipe = ref
        .watch(recipeByCategoryProvider(
            selectedCategory.value.replaceAll(" ", "")))
        .when(data: (e) {
      return e;
    }, error: (e, a) {
      return <Meals>[];
    }, loading: () {
          //
      return <Meals>[];
    });
    return Column(
      children: [
        const Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Popular category",
                style: h5,
              ),
            ),
          ],
        ),
        // categories
        SizedBox(
          height: 34,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemBuilder: (_, idx) {
                final selected = categories[idx] == selectedCategory.value;
                return Container(
                  width: 90,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: selected ? primaryColor : Colors.transparent,
                      borderRadius: BorderRadius.circular(10)),
                  child: InkWell(
                    onTap: () {
                      if (selected) {
                        selectedCategory.value = "";
                      } else {
                        selectedCategory.value = categories[idx];
                      }
                      onChangeCategory(selectedCategory.value); //
                    },
                    child: Text(
                      categories[idx],
                      style: small_bold.copyWith(
                          color: selected ? Colors.white : primaryColor),
                    ),
                  ),
                );
              },
              separatorBuilder: (_, __) {
                return const SizedBox(width: 8);
              },
              itemCount: categories.length),
        ),
        // Recipe
        SizedBox(
          height: 231,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, idx) {
                return SizedBox(
                  width: 150,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 176,
                          width: 150,
                          decoration: BoxDecoration(
                            color: neutral10,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 66, left: 12, right: 12, bottom: 12),
                            child: Column(
                              children: [
                                Text(
                                  recipe[idx].strMeal ?? "",
                                  textAlign: TextAlign.center,
                                ),
                                const Row(
                                  children: [
                                    Text("Time"),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("10 mins"),
                                    Container(
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(
                                          Icons.bookmark_add_outlined),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          height: 110,
                          width: 110,
                          decoration: const BoxDecoration(
                              color: neutral10, shape: BoxShape.circle),
                          child: ClipOval(
                            child: Image.network(
                              recipe[idx].strMealThumb ?? "",
                              fit: BoxFit.fill,
                              width: 110,
                              height: 110,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
              separatorBuilder: (ctx, idx) {
                return const SizedBox(width: 20);
              },
              itemCount: recipe.length),
        )
      ],
    );
  }
}
