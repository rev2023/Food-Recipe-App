import 'package:Food_Recipe_App/services/api/search_meal.api_dart';
import 'package:flutter/cupertino.dart';
import 'dart:math';

import '../services/api/random_meals_api.dart';
import '../models/meal.dart';

class SearchMealProvider extends ChangeNotifier {
  String _query = '';
  List<Meal> searchMealList = [];

  set query(String query){
    _query = query;
  }

  SearchMealProvider(){}

  void fetchData(){
    SearchMealApi searchMeal = SearchMealApi(_query);

    searchMeal.fetchData().then((meals) {
        searchMealList = meals.mealsList;
        print(searchMealList[0].strMeal);
        notifyListeners();

    });
    notifyListeners();



  }
}
