import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import 'package:Food_Recipe_App/models/meal_category.dart';

part 'meal_category_api.g.dart';

@RestApi(baseUrl: 'https://www.themealdb.com/api/json/v1/1')
abstract class MealCategoryApi {
  factory MealCategoryApi(Dio dio, {String baseUrl}) = _MealCategoryApi;

  @GET('/categories.php')
  Future<MealCategoryResponse> getMealCategories();
}
