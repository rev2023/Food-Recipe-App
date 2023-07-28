import 'package:dio/dio.dart';
import 'package:Food_Recipe_App/models/meal.dart';

class RandomMealApi {


  Future<MealList> fetchData() async {
    try {
      const apiEndpoint = 'https://www.themealdb.com/api/json/v1/1/random.php';
      final Response<dynamic> response = await Dio().get(apiEndpoint);
      return MealList.fromJson(response.data);
    } catch (error) {
      rethrow;
    }
  }
}
