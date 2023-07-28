import 'package:dio/dio.dart';
import 'package:Food_Recipe_App/models/meal.dart';



class SearchMealApi {

  String _searchTerm;
  String get searchTerm => _searchTerm;

  SearchMealApi(this._searchTerm);

  Future<MealList> fetchData() async {
    try {
      var apiEndpoint = 'https://www.themealdb.com/api/json/v1/1/search.php?s=$_searchTerm';
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
}
