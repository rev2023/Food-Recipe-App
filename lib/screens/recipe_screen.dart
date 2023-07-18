import 'package:auto_route/annotations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_app/models/recipe.dart';
import 'package:food_app/provider/random_meal_provider.dart';
import 'package:food_app/widgets/food_card.dart';
import 'package:provider/provider.dart';

import 'home_screen.dart';

@RoutePage()
class RecipeScreen extends StatelessWidget {
  final int index;

  RecipeScreen(this.index,);

  String searchValue = '';

  @override
  Widget build(BuildContext context) {
    final recipeProvider = Provider.of<Recipe>(context);
    print(index);
    recipeProvider.fetchData();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
          Column(
          children: [
          Container(
          width: double.infinity,
            height: 150,
            decoration: const BoxDecoration(
              color: Colors.tealAccent,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  'Find Recipe',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Icon(Icons.search),
                ),
              ],
            ),
          ),
              Consumer<Recipe>(
                builder: (context, recipeProvider, child) {
                  return Center(
                    child: Column(
                      children: [
                        Visibility(
                            visible: recipeProvider.isLoaded,
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
                                 Align(
                                   alignment: Alignment.centerLeft,
                                   child: Container( child: Center(child: Text('Recipe', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white), textAlign: TextAlign.center,)),
                                     width: 150,
                                    height: 35,
                                    decoration: const BoxDecoration(
                                      color: Colors.tealAccent,
                                      borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(50),
                                      ),
                                    ),),
                                 ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(recipeProvider.recipeInstructions[index], style: TextStyle(),),
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
