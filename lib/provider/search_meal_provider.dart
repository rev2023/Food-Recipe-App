import 'package:Food_Recipe_App/services/api/meal_by_category_api.dart';
import 'package:Food_Recipe_App/services/api/meal_by_id.dart';
import 'package:Food_Recipe_App/services/api/search_meal.api_dart';
import 'package:flutter/cupertino.dart';
import 'dart:math';

import '../services/api/random_meals_api.dart';
import '../models/meal.dart';

class SearchMealProvider extends ChangeNotifier {
  String _query = '';
  bool isLoading = true;
  List<Meal> searchMealList = [];

  set query(String query) {
    _query = query;
  }

  SearchMealProvider();

  void fetchSearchData() {
    SearchMealApi searchMeal = SearchMealApi(_query);

    searchMeal.fetchData().then((meals) {
      searchMealList = meals.mealsList;
      print(searchMealList[0].strMeal);
      notifyListeners();
    });

    // No need to call notifyListeners() here
  }

  void fetchCategoryData(String category) async {
    isLoading = true;
    searchMealList.clear();
    notifyListeners();

    MealByCategoryApi searchMeal = MealByCategoryApi(category);
    List<Meal> temporaryList = [];

    // Fetch meals by category
    MealList meals = await searchMeal.fetchData();
    temporaryList = meals.mealsList;

    // Clear the searchMealList
    searchMealList.clear();

    // Fetch detailed data for each meal and add it to searchMealList
    for (Meal meal in temporaryList) {
      MealByIdApi byIdApi = MealByIdApi(meal.idMeal);
      MealList mealDetail = await byIdApi.fetchData();
      if (mealDetail.mealsList.isNotEmpty) {
        searchMealList.add(mealDetail.mealsList[0]);
      }
    }

    isLoading = false;
    notifyListeners();
  }
}
