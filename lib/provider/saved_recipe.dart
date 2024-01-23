import 'dart:collection';

import 'package:food_recipe/data/meals.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final fetchedRecipeProvider = StateProvider<HashMap<String, Meals>>((ref) {
  return HashMap();
});