import 'package:Food_Recipe_App/provider/search_meal_provider.dart';
import 'package:Food_Recipe_App/widgets/app_bar.dart';
import 'package:Food_Recipe_App/widgets/carousel_card.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/meal_category_provider.dart';
import '../provider/random_meal_provider.dart';
import '../router/app_router.gr.dart';
import '../widgets/food_card.dart';
import '../widgets/search_bar.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  static List<String> imagePaths = [
    'lib/images/Chicken.png',
    'lib/images/Beef.png',
    'lib/images/Pork.png',
    'lib/images/Salmon.png',
    // Add more image paths as needed
  ];

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {



  @override
  Widget build(BuildContext context) {
    final mealCategoryProvider = Provider.of<MealCategoryProvider>(context);


    mealCategoryProvider.getMealCategories();
    List<String> imagePaths = [];
    List<String> categoryNames = [];

    for (var categoryImage in mealCategoryProvider.mealCategories) {
      imagePaths.add(categoryImage.strCategoryThumb);
    }
    for (var categoryName in mealCategoryProvider.mealCategories) {
      categoryNames.add(categoryName.strCategory);
    }

    return Scaffold(
      appBar: CustomAppBar(),
      body: ListView(
        children: [
          Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
          ),
          Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 35),
                  child: Container(
                    child: const Text(
                      'Categories',
                      style: TextStyle(
                        color: Colors.amberAccent,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  width: 300,
                  child: const Divider(color: Colors.amber),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: CarouselCard(
                    imagePaths,
                    categoryNames,

                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Column(
              children: [
                Column(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child:  Center(
                        child: Container(
                          child:  Text(
                            'Random Recipes',
                            style: TextStyle(
                              color: Colors.amberAccent,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                    Consumer<RandomMealProvider>(
                      builder: (context, mealProvider, _) {
                        mealProvider.fetchData();
                        return Column(
                          children: [
                            Row(
                              children: [
                                const SizedBox(height: 45, width: 20,),

                                FoodCard(
                                  imagePath: mealProvider.randomMealList[0].strMealThumb,
                                  text: mealProvider.randomMealList[0].strMeal,
                                  onTap: () {context.router.push(RecipeRoute(meal: mealProvider.randomMealList[0]));},
                                ),
                                const SizedBox(height: 45, width: 15,),
                                FoodCard(
                                  imagePath: mealProvider.randomMealList[1].strMealThumb,
                                  text: mealProvider.randomMealList[1].strMeal,
                                  onTap: () {context.router.push(RecipeRoute(meal: mealProvider.randomMealList[1]));},
                                ),

                              ],
                            ),
                            Row(
                              children: [
                                const SizedBox(height: 65, width: 17,),
                                FoodCard(
                                  imagePath: mealProvider.randomMealList[2].strMealThumb,
                                  text: mealProvider.randomMealList[2].strMeal,
                                  onTap: () {context.router.push(RecipeRoute(meal: mealProvider.randomMealList[3]));},
                                ),
                                const SizedBox(height: 45, width: 17,),
                                FoodCard(
                                  imagePath: mealProvider.randomMealList[3].strMealThumb,
                                  text: mealProvider.randomMealList[3].strMeal,
                                  onTap: () {context.router.push(RecipeRoute(meal: mealProvider.randomMealList[3]));},
                                ),

                              ],
                            ),
                          ],
                        );
                      },
                    ),
                    // Add more widgets as needed
                  ],
                ),
                SizedBox(height: 30,),
                Container(height: 20,decoration: const BoxDecoration(color:Colors.amber,borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)))
                )],

            ),
          ),
        ],

      ),
    );
  }
}
