import 'package:flutter/cupertino.dart';
import '../services/api/random_meals_api.dart';
import '../models/meal.dart';

class RandomMealProvider extends ChangeNotifier {
  List<Meal> randomMealList = [];
  bool isComplete = false;

  RandomMealProvider(){
    fetchData();
  }

  Future<void> fetchData() async {
    isComplete = false;

      for (int i = 0; i < 4; i++) {
        RandomMealApi randomMealApi = RandomMealApi();
        randomMealApi.fetchData().then((meals) {
          randomMealList.add(meals.mealsList[0]);
        });
        isComplete = true;
      }

  }
}
