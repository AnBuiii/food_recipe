import 'package:flutter/material.dart';
import 'package:food_recipe/data/meals.dart';
import 'package:food_recipe/feature/home/provider/recipe_providers.dart';
import 'package:food_recipe/feature/home/widget/recent_widget.dart';
import 'package:food_recipe/feature/home/widget/section_title.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RecentSection extends HookConsumerWidget {
  const RecentSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipes = ref.watch(recentProvider).when(data: (e) {
      print("asd");
      return e;
    }, error: (e, a) {
      print(e.toString() + "ee");
      return <Meals>[];
    }, loading: () {
      print("loading e");
      return <Meals>[];
    });
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        children: [
          const SectionTitle(title: "Recent recipe"),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            height: 191,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, idx) {
                return SizedBox(
                  width: 124,
                  child: RecentWidget(
                    recipe: recipes[idx],
                  ),
                );
              },
              separatorBuilder: (ctx, idx) {
                return const SizedBox(
                  width: 16,
                );
              },
              itemCount: recipes.length,
            ),
          )
        ],
      ),
    );
  }
}
