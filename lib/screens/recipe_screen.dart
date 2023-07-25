import 'package:Food_Recipe_App/provider/recipe_screen_provider.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:Food_Recipe_App/widgets/food_card.dart';
import 'package:Food_Recipe_App/widgets/app_bar.dart';
import 'package:provider/provider.dart';


@RoutePage()
class RecipeScreen extends StatelessWidget {


  RecipeScreen();


  @override
  Widget build(BuildContext context) {

    RecipeScreenProvider recipeProvider = Provider.of<RecipeScreenProvider>(context);

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
              imagePath: recipeProvider.meal.strMealThumb,
              text: recipeProvider.meal.strMeal,
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
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text('Area: ${recipeProvider.meal.strArea}'),
                  ),
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
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text('Category: ${recipeProvider.meal.strCategory}'),
                    ),
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
                  child: Text(recipeProvider.meal.strInstructions),
                ),
              ),
            ),


              ]),
            ],
          ),
        ),
      ),
    );
  }
}
