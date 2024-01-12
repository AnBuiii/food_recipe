import 'package:food_recipe/data/meals.dart';
import 'package:food_recipe/repository/recipe_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final futureRecipeProvider = FutureProvider.autoDispose<List<Meals>>((ref) {
  final weatherRepository = ref.watch(recipeProvider);
  return weatherRepository.getRecipes();
});

final recipeByCategoryProvider =
FutureProvider.autoDispose.family<List<Meals>, String>((ref, id) async {
  final recipeRepository = ref.watch(recipeProvider);
  return recipeRepository.getRecipeByCategory(id);
});

final recentProvider = FutureProvider.autoDispose<List<Meals>>((ref) {
  final recipeRepository = ref.watch(recipeProvider);
  return recipeRepository.getRecentRecipes();
});