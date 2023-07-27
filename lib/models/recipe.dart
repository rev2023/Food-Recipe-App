import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Recipe extends ChangeNotifier {
  late List<String> recipeName = [];
  late List<String> imagePath = [];
  late List<String> recipeInstructions= [];
   bool isLoaded = false;

  Future<void> fetchData() async {
    const randomRecipeCount = 4; // Number of random recipes to fetch
    const apiEndpoint = 'https://www.themealdb.com/api/json/v1/1/random.php';

    for (int i = 0; i < randomRecipeCount; i++) {
      final response = await http.get(Uri.parse(apiEndpoint));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final meals = jsonData['meals'];
        // print(meals);
        imagePath.add(meals[0]['strMealThumb']);
        recipeInstructions.add(meals[0]['strInstructions']);
        recipeName.add(meals[0]['strMeal']);
        notifyListeners();
        isLoaded = true;
        // print(recipeInstructions.toString());

        // Do additional processing with the fetched data

      } else {
        print('Error occurred: ${response.statusCode}');
      }

    }
  }
}
