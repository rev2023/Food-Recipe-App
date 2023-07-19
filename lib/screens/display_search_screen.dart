import 'package:Food_Recipe_App/widgets/app_bar.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:countries_flag/countries_flag.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/search_meal_provider.dart';
import '../router/app_router.gr.dart';
import '../widgets/food_card.dart';

@RoutePage()
class DisplaySearchScreen extends StatelessWidget {
  VoidCallback onTap = () {};

  DisplaySearchScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 30),
            Text('Your Search Results:'),
            SizedBox(height: 30),
            Expanded(
              child: ListView.builder(
                itemCount:
                Provider.of<SearchMealProvider>(context).searchMealList.length,
                itemBuilder: (context, index) {
                  var meal =
                  Provider.of<SearchMealProvider>(context).searchMealList[index];
                  return GestureDetector(
                    onTap: onTap,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: FoodCard(
                            imagePath: meal.strMealThumb,
                            text: meal.strMeal,
                            onTap: () {context.router.push(RecipeRoute(meal: meal));},
                          ),
                        ),
                        Container(
                          height: 140,
                          width: 140,
                          child: Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  decoration: BoxDecoration(
                                    color: Colors.white70,
                                    border: Border.fromBorderSide(BorderSide()),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  height: 60,
                                  child: Center(
                                    child: Text('Area: ${meal.strArea}'),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white70,
                                    border: Border.fromBorderSide(BorderSide()),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  height: 60,
                                  child: Center(
                                    child:
                                    Text('Category: ${meal.strCategory}'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
