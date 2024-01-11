import '../data/meals.dart';

abstract class RecipeRepository {
  Future<List<Meals>> getRecipes();
  Future<List<Meals>> getRecipeById(String id);


}
