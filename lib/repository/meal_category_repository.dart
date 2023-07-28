import '../models/meal_category.dart';
import '../services/api/meal_category_api.dart';


class MealCategoryRepository {
  final MealCategoryApi _mealCategoryApi;

  MealCategoryRepository(this._mealCategoryApi);

  Future<List<MealCategory>> getMealCategories() async {
    try {
      final mealCategoryResponse = await _mealCategoryApi.getMealCategories();
      return mealCategoryResponse.categories;
    } catch (e) {
      throw Exception('Failed to fetch meal categories: $e');
    }
  }
}





