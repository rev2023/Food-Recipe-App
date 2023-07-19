import 'package:Food_Recipe_App/services/api/meal_category_api.dart';

import '../services/api/meal_category_api.dart';

class MealCategoryResponse {
  final List<MealCategory> categories;

  MealCategoryResponse(this.categories);

  factory MealCategoryResponse.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw const FormatException('Null JSON provided to MealCategoryResponse');
    }

    final categoryList = json['categories'] as List<dynamic>;
    final categories = categoryList
        .map((categoryJson) => MealCategory.fromJson(categoryJson as Map<String, dynamic>))
        .toList();
    //print(categories);

    return MealCategoryResponse(categories);
  }
}

class MealCategory {
  final String idCategory;
  final String strCategory;
  final String strCategoryThumb;
  final String strCategoryDescription;

  MealCategory(this.idCategory, this.strCategory, this.strCategoryThumb, this.strCategoryDescription);

  factory MealCategory.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw const FormatException('Null JSON provided to MealCategoryResponse');
    }
    print(json['idCategory'] as String);


    return MealCategory(
      json['idCategory'] as String,
      json['strCategory'] as String,
      json['strCategoryThumb'] as String,
      json['strCategoryDescription'] as String,
    );
  }
}
