import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_app/models/meal_category.dart';
import 'package:food_app/widgets/food_card.dart';
import 'package:provider/provider.dart';

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
