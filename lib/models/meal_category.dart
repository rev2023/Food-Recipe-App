import 'package:json_annotation/json_annotation.dart';

part 'meal_category.g.dart';

@JsonSerializable()
class MealCategoryResponse {
  final List<MealCategory> categories;

  MealCategoryResponse(this.categories);

  factory MealCategoryResponse.fromJson(Map<String, dynamic> json) => _$MealCategoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MealCategoryResponseToJson(this);
}

@JsonSerializable()
class MealCategory {
  final String idCategory;
  final String strCategory;
  final String strCategoryThumb;
  final String strCategoryDescription;

  MealCategory(this.idCategory, this.strCategory, this.strCategoryThumb, this.strCategoryDescription);

  factory MealCategory.fromJson(Map<String, dynamic> json) => _$MealCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$MealCategoryToJson(this);
}
