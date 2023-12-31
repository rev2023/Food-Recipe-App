import 'package:dio/dio.dart';
import 'package:Food_Recipe_App/models/meal.dart';

class MealByCategoryApi {

  String _category;
  MealByCategoryApi(this._category);


  Future<MealList> fetchData() async {
    try {
      var apiEndpoint = 'https://www.themealdb.com/api/json/v1/1/filter.php?c=$_category';
      final Response<dynamic> response = await Dio().get(apiEndpoint);
      if (response.statusCode == 200) {
        return MealList.fromJson(response.data);
      } else {
        throw Exception('Failed to fetch meal data. StatusCode: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed to fetch meal data. Error: $error');
    }
  }
    // Do additional processing with the fetched data
  }

