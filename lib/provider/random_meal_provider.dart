import 'package:flutter/cupertino.dart';
import 'dart:math';

import '../services/api/random_meals_api.dart';
import '../models/meal.dart';

class RandomMealProvider extends ChangeNotifier {
  RandomMealApi randomMeal = RandomMealApi();
  List<Meal> randomMealList = [];

  RandomMealProvider(){}

  void fetchData(){
    if(randomMealList.length<=5) {
      randomMeal.fetchData().then((mealList) {
      randomMealList.add(mealList.mealsList[0]);
    });
    }
  }
}
