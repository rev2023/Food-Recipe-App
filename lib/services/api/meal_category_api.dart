import 'package:dio/dio.dart';
import 'package:Food_Recipe_App/models/meal_category.dart';

class MealCategoryApi {

  var apiEndpoint = 'https://www.themealdb.com/api/json/v1/1/categories.php';

  Future<MealCategoryResponse> fetchData() async {
    try {
      final Response<dynamic> response = await Dio().get(apiEndpoint);

      return MealCategoryResponse.fromJson(response.data);
    } catch (error) {
      rethrow;
    }

    // Do additional processing with the fetched data
  }
}
