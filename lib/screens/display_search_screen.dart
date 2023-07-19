import 'package:Food_Recipe_App/widgets/app_bar.dart';
import 'package:auto_route/annotations.dart';
import 'package:countries_flag/countries_flag.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/search_meal_provider.dart';
import '../widgets/food_card.dart';

@RoutePage()
class DisplaySearchScreen extends StatelessWidget {
  VoidCallback onTap = () {};

  DisplaySearchScreen();

  List<Widget> generateCards(BuildContext context) {
    SearchMealProvider searchMealProvider =
    Provider.of<SearchMealProvider>(context);

    if (searchMealProvider.searchMealList.isNotEmpty) {
      return List<Widget>.generate(searchMealProvider.searchMealList.length,
              (index) {
            return GestureDetector(
              onTap: onTap,
              child: ListTile(
                title: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: FoodCard(
                    imagePath:
                    searchMealProvider.searchMealList[index].strMealThumb,
                    text: searchMealProvider.searchMealList[index].strMeal,
                    onTap: () {},
                  ),
                ),
                trailing: Container(
                  height: 60,
                  width: 140,
                  child: Expanded(
                    child: OverflowBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                              color: Colors.tealAccent,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            height: 60,
                            child: Center(
                              child: Text(
                                'Area: ${searchMealProvider.searchMealList[index].strArea}',
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.tealAccent,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            height: 60,
                            child: Center(
                              child: Text(
                                'Category: ${searchMealProvider.searchMealList[index].strCategory}',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          });
    } else {
      return [
        Center(
          child: CircularProgressIndicator(),
        ), // Display a loading indicator
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: OverflowBox(
            maxHeight: double.infinity,
            child: Column(
              children: [
                SizedBox(height: 30),
                Text('Your Search Results:'),
                SizedBox(height: 30),
                SingleChildScrollView(
                  child: Column(
                    children: generateCards(context),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
