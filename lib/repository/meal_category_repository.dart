import 'package:Food_Recipe_App/models/meal_category.dart';
import 'package:Food_Recipe_App/services/api/meal_category_api.dart';
import 'package:Food_Recipe_App/services/services_configuration.dart';

class MealCategoryRepository {
  List<MealCategory> _mealCategoryList = [];

  MealCategoryRepository();

  List<MealCategory> get mealCategory => _mealCategoryList;

  Future<List<MealCategory>> getMealCategories() async {
    if (_mealCategoryList.isNotEmpty) {
      return _mealCategoryList;
    }
    else{
    return  getIt<MealCategoryApi>().fetchData().then((mealCategoryResponse) {
      final categories = mealCategoryResponse.categories;
       _mealCategoryList = categories;
       return _mealCategoryList;
    });}

  }
}
