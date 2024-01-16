import 'package:flutter/material.dart';
import 'package:food_recipe/data/meals.dart';
import 'package:food_recipe/feature/home/provider/recipe_providers.dart';
import 'package:food_recipe/feature/home/widget/section_title.dart';
import 'package:food_recipe/feature/home/widget/see_all.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RecentSection extends HookConsumerWidget {
  const RecentSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipe = ref.watch(recentProvider).when(data: (e) {
      print("asd");
      return e;
    }, error: (e, a) {
      print(e.toString() + "ee");

      return <Meals>[];
    }, loading: () {
      print("loading e");
      return <Meals>[];
    });
    return Column(
      children: [
        const SectionTitle(title: "Recent recipe"),
        SizedBox(
          height: 220,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, idx) {
                return SizedBox(
                  width: 124,
                  height: 220,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 124,
                        height: 124,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            recipe[idx].strMealThumb ?? "",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Text((recipe[idx].strMeal) ?? ""),
                      const Text("By Adrianna Curl")
                    ],
                  ),
                );
              },
              separatorBuilder: (ctx, idx) {
                return const SizedBox(
                  width: 16,
                );
              },
              itemCount: recipe.length),
        )
      ],
    );
  }
}
