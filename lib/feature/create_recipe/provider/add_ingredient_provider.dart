import 'package:food_recipe/feature/home/provider/recipe_providers.dart';
import 'package:food_recipe/utils/random_string.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final added_ingredient_provider =
    StateNotifierProvider<AddedIngredientNotifier, List<Pair>>(
        (ref) => AddedIngredientNotifier());

class AddedIngredientNotifier extends StateNotifier<List<Pair>> {
  AddedIngredientNotifier() : super([]);

  void addMore(String itemName, String quantity) {
    final id = getRandomString(4);
    state = [...state, Pair(id: id, first: itemName, second: quantity)];
  }

  void remove(int index) {
    state.removeAt(index);
    state = [...state];
  }
}

class Pair {
  final String id;
  final String first;
  final String second;

  Pair({required this.id, required this.first, required this.second});
}
