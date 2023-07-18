class MealList {
  List<Meal> mealsList;

  MealList(this.mealsList);

  factory MealList.fromJson(Map<String, dynamic> jsonData) {
    final meals = jsonData['meals'] as List<dynamic>;
    final mealsList = meals.map((meal) => Meal.fromJson(meal as Map<String, dynamic>)).toList();

    return MealList(mealsList);
  }
}

class Meal {
  String idMeal;
  String strMeal;
  String strCategory;
  String strArea;
  String strInstructions;
  String strMealThumb;

  Meal(this.idMeal, this.strMeal, this.strCategory, this.strArea, this.strInstructions, this.strMealThumb);

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      json['idMeal'] as String,
      json['strMeal'] as String,
      json['strCategory'] as String,
      json['strArea'] as String,
      json['strInstructions'] as String,
      json['strMealThumb'] as String
    );
  }
}
