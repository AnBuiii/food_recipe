import 'dart:math';

import 'package:food_recipe/data/meals.dart';
import 'package:food_recipe/repository/recipe_repository_impl.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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

class PopularNotifier extends StateNotifier<List<Meals>> {
  PopularNotifier(this.ref) : super([]) {
    fetch();
  }

  final StateNotifierProviderRef ref;

  Future<void> fetch() async {
    state = await ref.read(recipeProvider).getRecipeByCategory("Breakfast");
  }

  void addBefore() {
    state = [ Meals(
        idMeal: getRandomString(4),
        strMeal: 'OKEOKE',
        strCategory: '',
        strArea: '',
        strInstructions: '',
        strMealThumb:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/4/43/Ambersweet_oranges.jpg/1200px-Ambersweet_oranges.jpg',
        strTags: '',
        strYoutube: '',
        strIngredient1: '',
        strIngredient2: '',
        strIngredient3: '',
        strIngredient4: '',
        strIngredient5: '',
        strMeasure1: '',
        strMeasure2: '',
        strMeasure3: '',
        strMeasure4: '',
        strMeasure5: ''), ...state];
  }

  void addAfter() {
    state = [...state , Meals(
        idMeal: getRandomString(4),
        strMeal: 'OKEOKE',
        strCategory: '',
        strArea: '',
        strInstructions: '',
        strMealThumb:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/4/43/Ambersweet_oranges.jpg/1200px-Ambersweet_oranges.jpg',
        strTags: '',
        strYoutube: '',
        strIngredient1: '',
        strIngredient2: '',
        strIngredient3: '',
        strIngredient4: '',
        strIngredient5: '',
        strMeasure1: '',
        strMeasure2: '',
        strMeasure3: '',
        strMeasure4: '',
        strMeasure5: '')];
  }
}

final popularProvider = StateNotifierProvider<PopularNotifier, List<Meals>>(
    (ref) => PopularNotifier(ref));

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random _rnd = Random();

String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
    length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
