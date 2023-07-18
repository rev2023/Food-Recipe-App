import 'package:flutter/material.dart';
import 'package:food_app/provider/meal_category_provider.dart';
import 'package:food_app/provider/random_meal_provider.dart';
import 'package:food_app/repository/meal_category_repository.dart';
import 'package:food_app/services/api/meal_category_api.dart';
import 'package:food_app/services/api/random_meals_api.dart';
import 'package:provider/provider.dart';

import 'models/recipe.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<MealCategoryApi>(
          create: (context) => MealCategoryApi(),
        ),
        ProxyProvider<MealCategoryApi, MealCategoryRepository>(
          update: (context, api, previousRepository) =>
              MealCategoryRepository(api),
        ),
        ChangeNotifierProvider<MealCategoryProvider>(
          create: (context) => MealCategoryProvider(
            Provider.of<MealCategoryRepository>(context, listen: false),
          ),
        ),
        ChangeNotifierProvider<RandomMealProvider>(
          create: (context) => RandomMealProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
