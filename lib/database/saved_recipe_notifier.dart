import 'dart:collection';

import 'package:food_recipe/data/meals.dart';
import 'package:food_recipe/database/app_database.dart';
import 'package:food_recipe/repository/recipe_repository.dart';
import 'package:food_recipe/repository/recipe_repository_impl.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final savedRecipeProvider =
    StateNotifierProvider.autoDispose<SavedRecipeNotifier, List<Meals>>(
        (ref) => SavedRecipeNotifier(ref));

class SavedRecipeNotifier extends StateNotifier<List<Meals>> {
  late List<String> ids;
  late RecipeRepository recipeRepository;
  late StateNotifierProviderRef ref;
  late Map<String, Meals> mealMap;

  SavedRecipeNotifier(this.ref) : super([]) {
    mealMap = HashMap();
    recipeRepository = ref.read(recipeProvider);
    ref.listen(provideSavedIdNotifier, (prev, next) async {
      final futureList = next.map((id) async {
        if (!mealMap.containsKey(id)) {
          print("fetch " + id);
          final newMeals = await recipeRepository.getMealsById(id);
          mealMap[id] = newMeals;
        }
        return mealMap[id]!;
      });
      state = await Future.wait(futureList);
    }, fireImmediately: true);
  }
}
