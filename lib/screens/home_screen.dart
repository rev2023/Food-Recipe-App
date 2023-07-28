import 'package:Food_Recipe_App/provider/recipe_screen_provider.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Food_Recipe_App/router/app_router.gr.dart';
import 'package:Food_Recipe_App/widgets/app_bar.dart';
import 'package:Food_Recipe_App/widgets/carousel_card.dart';
import 'package:Food_Recipe_App/widgets/food_card.dart';
import 'package:Food_Recipe_App/provider/home_screen_provider.dart';

import '../styles/app_colors.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeScreenProvider = Provider.of<HomeScreenProvider>(context);
    var recipeScreenProvider = Provider.of<RecipeScreenProvider>(context, listen: false);

    return Scaffold(
      appBar:  CustomAppBar(),
      body: Visibility(
        visible: homeScreenProvider.randomMealList.isNotEmpty,
        replacement: const Center(child: CircularProgressIndicator(color: Colors.yellow)),
        child: ListView(
          children: [
            Container(
              height: 50,
              decoration:  BoxDecoration(
                color: AppColors.primaryColor,
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
                      child:  Text(
                        'Categories',
                        style: TextStyle(
                          color: AppColors.headerColor,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    width: 300,
                    child:  Divider(color: AppColors.primaryColor),
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
                            child:  Text(
                              'Take your pick',
                              style: TextStyle(
                                color: AppColors.headerColor,
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
                                    recipeScreenProvider.set(homeScreenProvider.randomMealList[0]);
                                    context.router.push(const RecipeRoute());
                                  },
                                ),
                              const SizedBox(height: 45, width: 15),
                                FoodCard(
                                  imagePath: homeScreenProvider.randomMealList[1].strMealThumb,
                                  text: homeScreenProvider.randomMealList[1].strMeal,
                                  onTap: () {
                                    recipeScreenProvider.set(homeScreenProvider.randomMealList[1]);
                                    context.router.push(const RecipeRoute( ));
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

                                    recipeScreenProvider.set(homeScreenProvider.randomMealList[2]);
                                    context.router.push(const RecipeRoute());
                                  },
                                ),
                              const SizedBox(height: 45, width: 17),
                                FoodCard(
                                  imagePath: homeScreenProvider.randomMealList[3].strMealThumb,
                                  text: homeScreenProvider.randomMealList[3].strMeal,
                                  onTap: () {
                                    recipeScreenProvider.set(homeScreenProvider.randomMealList[3]);
                                    context.router.push(const RecipeRoute());
                                  },
                                ),
                            ],
                          )
                        ],
                      ),
                      // Add more widgets as needed
                    ],
                  ),
                  const SizedBox(height: 120),
                  Container(
                    height: 20,
                    decoration:  BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: const BorderRadius.only(
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
