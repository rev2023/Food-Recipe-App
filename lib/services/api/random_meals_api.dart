import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_app/models/meal_category.dart';
import 'package:food_app/widgets/food_card.dart';
import 'package:provider/provider.dart';

import '../../models/meal.dart';

class RandomMealApi {


  Future<MealList> fetchData() async {
    try {
      const apiEndpoint = 'https://www.themealdb.com/api/json/v1/1/random.php';
      final Response<dynamic> response = await Dio().get(apiEndpoint);
      // print(response.data);
      return MealList.fromJson(response.data);
    } catch (error) {
      rethrow;
    }
  }
}
