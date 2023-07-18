import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_app/models/meal_category.dart';
import 'package:food_app/widgets/food_card.dart';
import 'package:provider/provider.dart';

import '../../models/meal.dart';

class SearchMealApi {

String _searchTerm = '';
String get searchTerm => _searchTerm;

set(String term){
  _searchTerm = term;
}
  Future<MealList> fetchData() async {
    try {
      var apiEndpoint = 'https://www.themealdb.com/api/json/v1/1/.php$searchTerm';
      final Response<dynamic> response = await Dio().get(apiEndpoint);
      return MealList.fromJson(response.data);
    } catch (error) {
      rethrow;
    }
  }
}
