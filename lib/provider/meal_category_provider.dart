import 'package:flutter/material.dart';
import 'package:Food_Recipe_App/models/meal_category.dart';
import 'package:Food_Recipe_App/repository/meal_category_repository.dart';
import 'package:provider/provider.dart';

class MealCategoryProvider extends ChangeNotifier {
  final MealCategoryRepository _mealCategoryRepository;

  List<MealCategory> _mealCategories = [];
  List<MealCategory> get mealCategories => _mealCategories;

  MealCategoryProvider(this._mealCategoryRepository){
    getMealCategories();
  }
  void getMealCategories() async {
    // Start loading
    List<MealCategory> categories = await _mealCategoryRepository.getMealCategories();
    _mealCategories = categories;
    notifyListeners();
  }
}

