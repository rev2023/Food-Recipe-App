import 'package:Food_Recipe_App/services/api/meal_by_category_api.dart';
import 'package:Food_Recipe_App/services/api/meal_by_id.dart';
import 'package:Food_Recipe_App/services/api/random_meals_api.dart';
import 'package:Food_Recipe_App/services/api/search_meal.api.dart';
import 'package:get_it/get_it.dart';

import 'api/meal_category_api.dart';

final getIt = GetIt.instance;


void setupDependencies() {

  // Registering APIs with interfaces or abstract classes
  getIt.registerSingleton<RandomMealApi>(RandomMealApi());

}
