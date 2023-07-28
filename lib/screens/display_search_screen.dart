import 'package:Food_Recipe_App/provider/recipe_screen_provider.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Food_Recipe_App/provider/search_screen_provider.dart';
import 'package:Food_Recipe_App/router/app_router.gr.dart';
import 'package:Food_Recipe_App/widgets/food_card.dart';
import 'package:Food_Recipe_App/widgets/display_search_screen_app_bar.dart';
import 'package:Food_Recipe_App/styles/app_colors.dart';

@RoutePage()
class DisplaySearchScreen extends StatelessWidget {
  const DisplaySearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var searchMealProvider = Provider.of<SearchScreenProvider  >(context);
    var searchMealList = searchMealProvider.searchMealList;
    var recipeScreenProvider = Provider.of<RecipeScreenProvider>(context);

    return Scaffold(
      appBar: DisplayScreenAppBar(),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 30),
            const Center(child: Text('Your Search Results:')),
            SizedBox(height: 30),
            Visibility(
              replacement: CircularProgressIndicator(color: AppColors.headerColor,),
              visible: !searchMealProvider.isLoading,
              child: Expanded(
                child: ListView.builder(
                  itemCount: searchMealList.length,
                  itemBuilder: (context, index) {
                    var meal = searchMealList[index];
                    return Center(
                      child: GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: FoodCard(
                                imagePath: meal.strMealThumb,
                                text: meal.strMeal,
                                onTap: () {
                                  recipeScreenProvider.set(meal);
                                  context.router.push(const RecipeRoute());
                                },
                              ),
                            ),
                            Container(
                              height: 140,
                              width: 140,
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
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
