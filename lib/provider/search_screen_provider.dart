import 'package:Food_Recipe_App/services/api/meal_by_category_api.dart';
import 'package:Food_Recipe_App/services/api/meal_by_id.dart';
import 'package:Food_Recipe_App/services/api/search_meal.api.dart';
import 'package:flutter/cupertino.dart';
import 'package:Food_Recipe_App/models/meal.dart';

class SearchScreenProvider extends ChangeNotifier {
  String _query = '';
  bool isLoading = false;
  List<Meal> searchMealList = [];
  bool _throughCategory = false;
  bool get throughCategorySearch => _throughCategory;
  set throughCategory(bool throughCategory){
    _throughCategory = throughCategory;
    notifyListeners();
  }

  set query(String query) {
    _query = query;
  }

  SearchScreenProvider();

  void fetchSearchData() {
    isLoading = true;
    SearchMealApi searchMeal = SearchMealApi(_query);

    searchMeal.fetchData().then((meals) {
      searchMealList = meals.mealsList;
      print(searchMealList[0].strMeal);
      notifyListeners();
    });
    isLoading = false;


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
