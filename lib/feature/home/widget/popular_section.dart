import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_recipe/data/meals.dart';
import 'package:food_recipe/database/app_database.dart';
import 'package:food_recipe/feature/home/provider/recipe_providers.dart';
import 'package:food_recipe/utils/colors.dart';
import 'package:food_recipe/utils/typo.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final categories =
    ["Salad", "Break fast", "Appetizer", "Noodle", "Lunch"].toList();

class PopularSection extends HookConsumerWidget {
  final Function(String) onChangeCategory;

  const PopularSection(this.onChangeCategory, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCategory = useState("Break fast");
    final recipe = ref.watch(popularProvider);
    final scrollController = useScrollController();
    print("asd");
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
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
          const SizedBox(
            height: 16,
          ),

          /// Category
          SizedBox(
            height: 34,
            child: ListView.custom(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              childrenDelegate: SliverChildBuilderDelegate((_, idx) {
                final selected = categories[idx] == selectedCategory.value;
                return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
              }, childCount: categories.length),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextButton(
            child: const Text(
              "add before",
            ),
            onPressed: () {
              ref.read(popularProvider.notifier).addBefore();
              if (scrollController.position.pixels != 0) {
                scrollController.jumpTo(scrollController.position.pixels + 150);
              }
            },
          ),
          TextButton(
            child: const Text(
              "add after",
            ),
            onPressed: () {
              ref.read(popularProvider.notifier).addAfter();
            },
          ),

          /// Recipes
          SizedBox(
            height: 231,
            child: ListView.separated(
              controller: scrollController,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                final newKey = Key(recipe[index].idMeal ?? "");
                return PopularWidget(
                  recipe: recipe[index],
                  key: newKey,
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                final newKey = Key("separate${recipe[index].idMeal ?? ""}");
                return SizedBox(
                  key: newKey,
                  width: 20,
                );
              },
              itemCount: recipe.length,
              findChildIndexCallback: (key) {
                final valueKey = key as ValueKey;

                var add = 0;
                if ((valueKey.value as String).startsWith("separate")) {
                  add = 1;
                }
                var index =
                    recipe.indexWhere((item) => item.idMeal == valueKey.value);
                if (index == -1) return null;

                return index * 2 + add;
              },
            ),
          )
        ],
      ),
    );
  }
}

class PopularWidget extends ConsumerWidget {
  final Meals recipe;

  const PopularWidget({super.key, required this.recipe});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        recipe.strMeal ?? "",
                        textAlign: TextAlign.center,
                        style: label_bold,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Wrap(
                        direction: Axis.vertical,
                        children: [
                          Text(
                            "Time",
                            style: small_regular.copyWith(color: neutral30),
                          ),
                          Text(
                            "${recipe.idMeal ?? ""} mins",
                            style: small_bold,
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: BookMark(
                        recipeId: recipe.idMeal ?? "",
                      ),
                    ),
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
              decoration:
                  const BoxDecoration(color: neutral10, shape: BoxShape.circle),
              child: ClipOval(
                child: Image.network(
                  recipe.strMealThumb ?? "",
                  fit: BoxFit.fill,
                  width: 110,
                  height: 110,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BookMark extends ConsumerWidget {
  final String recipeId;

  const BookMark({super.key, required this.recipeId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        final isSelected = ref.read(provideSavedIdNotifier).contains(recipeId);
        if (isSelected) {
          ref.read(provideSavedIdNotifier.notifier).removeString(recipeId);
        } else {
          ref.read(provideSavedIdNotifier.notifier).addId(recipeId);
        }
      },
      child: Container(
        alignment: Alignment.center,
        width: 36,
        height: 36,
        decoration:
            const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
        child: SvgPicture.asset(
          ref.watch(provideSavedIdNotifier
                  .select((value) => value.contains(recipeId)))
              ? "assets/ic_bookmark_active.svg"
              : "assets/ic_bookmark_inactive.svg",
          width: 16,
          height: 16,
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }
}
