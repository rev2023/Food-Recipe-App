import 'package:dio/dio.dart';
import 'package:Food_Recipe_App/models/meal.dart';

class MealByIdApi {
  String _id;

  MealByIdApi(this._id);

  Future<MealList> fetchData() async {
    try {
      // API endpoint for fetching meal data by ID
      var apiEndpoint = 'https://www.themealdb.com/api/json/v1/1/lookup.php?i=$_id';

      // Make the HTTP GET request using Dio
      final Response<dynamic> response = await Dio().get(apiEndpoint);

      if (response.statusCode == 200) {
        // Convert the response data into MealList object using the MealList.fromJson constructor
        return MealList.fromJson(response.data);
      } else {
        // Throw an exception if the API call was not successful
        throw Exception('Failed to fetch meal data. StatusCode: ${response.statusCode}');
      }
    } catch (error) {
      // Catch any errors that occurred during the API call
      throw Exception('Failed to fetch meal data. Error: $error');
    }
  }
}
