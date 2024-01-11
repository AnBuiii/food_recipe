import 'package:dio/dio.dart';
import 'package:dio/src/dio.dart';
import 'package:food_recipe/data/meals.dart';
import 'package:food_recipe/repository/recipe_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final recipeProvider = Provider<RecipeRepository>((ref) {
  return RecipeRepositoryImpl();
});

final futureRecipeProvider = FutureProvider.autoDispose<List<Meals>>((ref) {
  final weatherRepository = ref.watch(recipeProvider);
  return weatherRepository.getRecipes();
});



class RecipeNotifier extends StateNotifier<List<Meals>>{
  RecipeNotifier(super.state);

  void getListRecipes(){
    final list = <Meals>[];
    final tempList = <Meals>[...state];
    tempList.addAll(list);
    state = tempList;
  }
}

class RecipeRepositoryImpl implements RecipeRepository {
  late Dio dio;

  RecipeRepositoryImpl() {
    dio = Dio();
  }

  @override
  Future<List<Meals>> getRecipes() async {
    final response = await dio.get(
        "https://www.themealdb.com/api/json/v1/1/search.php?s=Arrabiata");
    final hm = response.data as Map<String, dynamic>;
    final meals = hm['meals'] as List<dynamic>;
    return meals.map((e) {
      return Meals.fromJson(e as Map<String, dynamic>);
    }).toList();
  }

  @override
  Future<List<Meals>> getRecipeById(String id) {
    // TODO: implement getRecipeById
    throw UnimplementedError();
  }

}
