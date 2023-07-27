import 'package:Food_Recipe_App/provider/home_screen_provider.dart';
import 'package:Food_Recipe_App/provider/recipe_screen_provider.dart';
import 'package:Food_Recipe_App/provider/search_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:Food_Recipe_App/repository/meal_category_repository.dart';
import 'package:Food_Recipe_App/services/api/meal_category_api.dart';
import 'package:provider/provider.dart';
import 'package:Food_Recipe_App/router/app_router.dart';

import 'models/meal.dart';

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

        ChangeNotifierProvider<HomeScreenProvider>(
          create: (context) => HomeScreenProvider(Provider.of<MealCategoryRepository>(context,listen: false)),
        ),

        ChangeNotifierProvider<SearchScreenProvider>(
          create: (context) => SearchScreenProvider(),
         ),
        ChangeNotifierProvider<RecipeScreenProvider>(
          create: (context) => RecipeScreenProvider(),
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
    AppRouter appRouter = AppRouter();

    return MaterialApp.router(
      routerConfig: appRouter.config(),
      debugShowCheckedModeBanner: false,

        title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
