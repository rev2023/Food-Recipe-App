import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:Food_Recipe_App/widgets/food_card.dart';
import 'package:Food_Recipe_App/models/meal.dart';
import 'package:Food_Recipe_App/widgets/app_bar.dart';


@RoutePage()
class RecipeScreen extends StatelessWidget {
  final Meal _meal;

  RecipeScreen(this._meal, {super.key});


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
                    child: Text('Category: ${_meal.strCategory}'),
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


              ]),
            ],
          ),
        ),
      ),
    );
  }
}
