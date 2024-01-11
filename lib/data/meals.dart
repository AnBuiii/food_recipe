import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
//
// required: associates our `main.dart` with the code generated by Freezed
part 'meals.freezed.dart';
// optional: Since our Person class is serializable, we must add this line.
// But if Person was not serializable, we could skip it.
part 'meals.g.dart';
@freezed
class Meals with _$Meals {
  const factory Meals({
    required String? idMeal,
    required String? strMeal,
    required String? strCategory,
    required String? strArea,
    required String? strInstructions,
    required String? strMealThumb,
    required String? strTags,
    required String? strYoutube,
    required String? strIngredient1,
    required String? strIngredient2,
    required String? strIngredient3,
    required String? strIngredient4,
    required String? strIngredient5,
    required String? strMeasure1,
    required String? strMeasure2,
    required String? strMeasure3,
    required String? strMeasure4,
    required String? strMeasure5
  }) = _Meals;

  factory Meals.fromJson(Map<String, Object?> json)
  => _$MealsFromJson(json);
}
