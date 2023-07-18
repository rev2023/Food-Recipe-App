import '../models/meal_category.dart';
import '../services/api/meal_category_api.dart';

class MealCategoryRepository {
  final MealCategoryApi mealCategoryApi;
  List<MealCategory> _mealCategoryList = [];

  MealCategoryRepository(this.mealCategoryApi);

  List<MealCategory> get mealCategory => _mealCategoryList;

  Future<List<MealCategory>> getMealCategories() async {
    if (_mealCategoryList.isNotEmpty) {
      return _mealCategoryList;
    }
    else{
    return  mealCategoryApi.fetchData().then((mealCategoryResponse) {
      final categories = mealCategoryResponse.categories;
       _mealCategoryList = categories;
       return _mealCategoryList;
    });}

  }
}
