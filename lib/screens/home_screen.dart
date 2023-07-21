import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Food_Recipe_App/router/app_router.gr.dart';
import 'package:Food_Recipe_App/widgets/app_bar.dart';
import 'package:Food_Recipe_App/widgets/carousel_card.dart';
import 'package:Food_Recipe_App/widgets/food_card.dart';

import '../provider/home_screen_provider.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeScreenProvider = Provider.of<HomeScreenProvider>(context, listen: true);


    return Scaffold(
      appBar: CustomAppBar(),
      body: Visibility(
        visible: homeScreenProvider.randomMealList.length >= 4 && homeScreenProvider.mealCategories.isNotEmpty,
        replacement: Center(child: CircularProgressIndicator()),
        child: ListView(
          children: [
            Container(
              height: 50,
              decoration: const BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.only(
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
                      homeScreenProvider.categoryImagePaths,
                      homeScreenProvider.categoryNames,
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
                        child: Center(
                          child: Container(
                            child: const Text(
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

                        Column(
                        children: [
                           if (homeScreenProvider.randomMealList.length > 3)

                            Row(
                            children: [
                              const SizedBox(height: 45, width: 20),
                                FoodCard(
                                  imagePath: homeScreenProvider.randomMealList[0].strMealThumb,
                                  text: homeScreenProvider.randomMealList[0].strMeal,
                                  onTap: () {
                                    context.router.push(RecipeRoute(meal: homeScreenProvider.randomMealList[0]));
                                  },
                                ),
                              const SizedBox(height: 45, width: 15),
                                FoodCard(
                                  imagePath: homeScreenProvider.randomMealList[1].strMealThumb,
                                  text: homeScreenProvider.randomMealList[1].strMeal,
                                  onTap: () {
                                    context.router.push(RecipeRoute(meal: homeScreenProvider.randomMealList[1]));
                                  },
                                ),
                            ],
                          ),
                          if (homeScreenProvider.randomMealList.length > 3)

                            Row(
                            children: [
                              const SizedBox(height: 65, width: 17),
                                FoodCard(
                                  imagePath: homeScreenProvider.randomMealList[2].strMealThumb,
                                  text: homeScreenProvider.randomMealList[2].strMeal,
                                  onTap: () {
                                    context.router.push(RecipeRoute(meal: homeScreenProvider.randomMealList[2]));
                                  },
                                ),
                              const SizedBox(height: 45, width: 17),
                                FoodCard(
                                  imagePath: homeScreenProvider.randomMealList[3].strMealThumb,
                                  text: homeScreenProvider.randomMealList[3].strMeal,
                                  onTap: () {
                                    context.router.push(RecipeRoute(meal: homeScreenProvider.randomMealList[3]));
                                  },
                                ),
                            ],
                          )
                        ],
                      ),
                      // Add more widgets as needed
                    ],
                  ),
                  SizedBox(height: 30),
                  Container(
                    height: 20,
                    decoration: const BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
