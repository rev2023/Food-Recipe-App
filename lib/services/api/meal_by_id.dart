import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:Food_Recipe_App/models/meal_category.dart';
import 'package:Food_Recipe_App/widgets/food_card.dart';
import 'package:provider/provider.dart';

import '../../models/meal.dart';

class MealByIdApi {

  String _id;

  MealByIdApi(this._id);


  Future<MealList> fetchData() async {
    try {
      var apiEndpoint = 'https://www.themealdb.com/api/json/v1/1/lookup.php?i=$_id';
      final Response<dynamic> response = await Dio().get(apiEndpoint);
      if (response.statusCode == 200) {
        print(apiEndpoint);
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

