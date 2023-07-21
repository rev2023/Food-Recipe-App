import 'package:flutter/cupertino.dart';
import 'package:Food_Recipe_App/services/api/random_meals_api.dart';
import 'package:Food_Recipe_App/models/meal.dart';

import '../models/meal_category.dart';
import '../repository/meal_category_repository.dart';

class RecipeScreenProvider extends ChangeNotifier {

  late Meal _meal;

Meal get meal => _meal;
set (Meal meal){
  _meal = meal;
}




}