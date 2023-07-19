import 'package:Food_Recipe_App/provider/search_meal_provider.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:Food_Recipe_App/models/recipe.dart';
import 'package:Food_Recipe_App/provider/random_meal_provider.dart';
import 'package:Food_Recipe_App/widgets/food_card.dart';
import 'package:provider/provider.dart';

import '../models/meal.dart';
import '../widgets/app_bar.dart';
import 'home_screen.dart';

@RoutePage()
class RecipeScreen extends StatelessWidget {
  final Meal _meal;

  RecipeScreen(this._meal,);

  String searchValue = '';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:CustomAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
          Column(
          children: [
            SizedBox(height: 30,),
            FoodCard(
              imagePath: _meal.strMealThumb,
              text: _meal.strMeal,
              onTap: () {},
            ),             Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [  Container(
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.white70,
                  border: Border.fromBorderSide(BorderSide()),
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 60,
                child: Center(
                  child: Text('Area: ${_meal.strArea}'),
                ),
              ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    border: Border.fromBorderSide(BorderSide()),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: 60,
                  child: Center(
                    child: Text('Area: ${_meal.strCategory}'),
                  ),
                ),

              ],
            ),
            Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white70,
                border: Border.fromBorderSide(BorderSide()),
                borderRadius: BorderRadius.circular(20),

              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(_meal.strInstructions),
                ),
              ),
            ),

              Consumer<SearchMealProvider>(
                builder: (context, recipeProvider, child) {
                  return Center(
                    child: Column(
                      children: [
                        Visibility(
                            visible: recipeProvider.searchMealList.isNotEmpty,
                            replacement: const CircularProgressIndicator(),
                            child: Column(
                              children: [

                                const SizedBox(
                                  height: 65,
                                ),

                                const SizedBox(
                                  width: 300,
                                  child: Divider(color: Colors.tealAccent, height: 55,),
                                ),

                                const SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(_meal.strMeal, style: TextStyle(),),
                                ),
                                const SizedBox(
                                  width: 300,
                                  height: 30,
                                ),

                              ],
                            )),
                      ],
                    ),
                  );
                },
              ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
