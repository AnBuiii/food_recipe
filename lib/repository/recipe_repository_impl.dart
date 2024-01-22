import 'dart:async';
import 'dart:collection';

import 'package:dio/dio.dart';
import 'package:dio/src/dio.dart';
import 'package:food_recipe/data/meals.dart';
import 'package:food_recipe/database/saved_recipe.dart';
import 'package:food_recipe/repository/recipe_repository.dart';
import 'package:food_recipe/utils/const.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final recipeProvider = Provider<RecipeRepository>((ref) {
  return RecipeRepositoryImpl(ref);
});

class RecipeRepositoryImpl implements RecipeRepository {
  late Dio dio;
  late HashMap fetchedRecipe;
  late ProviderRef ref;

  RecipeRepositoryImpl(this.ref) {
    dio = Dio();
    fetchedRecipe = ref.watch(fetchedRecipeProvider);
  }

  @override
  Future<List<Meals>> getRecipes() async {
    final response = await dio.get("$BASE_URL/search.php?s=Arrabiata");
    final hm = response.data as Map<String, dynamic>;
    final meals = hm['meals'] as List<dynamic>;
    return meals.map((e) {
      final meal = Meals.fromJson(e as Map<String, dynamic>);
      fetchedRecipe[meal.idMeal] = meal;
      return meal;
    }).toList();
  }

  @override
  Future<List<Meals>> getRecipeByCategory(String category) async {
    final response = await dio.get("$BASE_URL/filter.php?c=$category");
    try {
      final map = response.data as Map<String, dynamic>;
      final meals = map['meals'] as List<dynamic>;
      return meals.map((e) {
        final meal = Meals.fromJson(e as Map<String, dynamic>);
        fetchedRecipe[meal.idMeal] = meal;
        return meal;
      }).toList();
    } catch (e) {
      return [];
    }
  }

  @override
  Future<List<Meals>> getRecentRecipes() async {
    final response =
        await dio.get("https://www.themealdb.com/api/json/v1/1/search.php?f=a");
    try {
      final map = response.data as Map<String, dynamic>;
      final meals = map['meals'] as List<dynamic>;
      return meals.map((e) {
        final meal = Meals.fromJson(e as Map<String, dynamic>);
        fetchedRecipe[meal.idMeal] = meal;
        return meal;
      }).toList();
    } catch (e) {
      return [];
    }
  }

  @override
  Future<Meals> getMealsById(String id) async {
    if(fetchedRecipe[id] != null) return fetchedRecipe[id];
    print("fetch $id");
    final response = await dio
        .get("https://www.themealdb.com/api/json/v1/1/lookup.php?i=$id");
    try {
      final map = response.data as Map<String, dynamic>;
      final meals = map['meals'] as List<dynamic>;
      final meal = Meals.fromJson(meals[0]);
      fetchedRecipe[meal.idMeal] = meal;
      return meal;
    } catch (e) {
      throw Exception();
    }
  }
}
