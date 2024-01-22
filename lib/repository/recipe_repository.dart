import '../data/meals.dart';

abstract class RecipeRepository {
  Future<List<Meals>> getRecipes();

  Future<List<Meals>> getRecentRecipes();

  Future<List<Meals>> getRecipeByCategory(String category);

  Future<Meals> getMealsById(String id);
}
