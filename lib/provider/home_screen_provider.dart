import 'package:Food_Recipe_App/provider/async_change_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:Food_Recipe_App/services/api/random_meals_api.dart';
import 'package:Food_Recipe_App/models/meal.dart';
import 'package:Food_Recipe_App/services/services_configuration.dart';


import 'package:Food_Recipe_App/models/meal_category.dart';
import 'package:Food_Recipe_App/repository/meal_category_repository.dart';

class HomeScreenProvider extends ChangeNotifier {
  List<Meal> randomMealList = [];
  final MealCategoryRepository _mealCategoryRepository;
  List<MealCategory> _mealCategories = [];

  List<MealCategory> get mealCategories => _mealCategories;

  List<String> categoryImagePaths = [];
  List<String> categoryNames = [];

  HomeScreenProvider(this._mealCategoryRepository) {
    fetchRandomMeals();
    fetchMealCategories();
  }

  Future<void> fetchRandomMeals() async {
    for (int i = 0; i < 4; i++) {
      getIt<RandomMealApi>().fetchData().then((meals) {
        randomMealList.add(meals.mealsList[0]);
      });
    }
    notifyListeners();

  }

  Future<void> fetchMealCategories() async {
    // Start loading
    List<MealCategory> categories = await _mealCategoryRepository.getMealCategories();
    _mealCategories = categories;

    // Populate the categoryImagePaths and categoryNames lists
    for (var categoryImage in _mealCategories) {
      categoryImagePaths.add(categoryImage.strCategoryThumb);
      categoryNames.add(categoryImage.strCategory);
    }

    notifyListeners();
  }
}
