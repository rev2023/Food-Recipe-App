import 'package:flutter/cupertino.dart';
import 'package:Food_Recipe_App/services/api/random_meals_api.dart';
import 'package:Food_Recipe_App/models/meal.dart';


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
