import 'package:dio/dio.dart';

class RecipeRepository {
  Future<String?> getRecipes() async {
    return (await Dio().get<String>(
            "https://www.themealdb.com/api/json/v1/1/search.php?s=Arrabiata"))
        .data;
  }
}
