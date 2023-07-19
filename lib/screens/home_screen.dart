import 'package:Food_Recipe_App/widgets/app_bar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/meal_category_provider.dart';
import '../provider/random_meal_provider.dart';
import '../router/app_router.gr.dart';
import '../widgets/food_card.dart';
import '../widgets/search_bar.dart';

class CarouselCard extends StatelessWidget {
  final List<String> imagePaths;
  final List<String> categoryNames;
  final VoidCallback onTap;

  CarouselCard(this.imagePaths, this.categoryNames, this.onTap, {Key? key})
      : super(key: key);

  List<Widget> generateCards(int length) {
    return List<Widget>.generate(length, (index) {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.fromLTRB(25, 50, 15, 100),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(imagePaths[index]),
                    ),
                  ),
                  width: 250,
                  height: 200,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.black.withOpacity(0.4),
                  ),
                  width: 250,
                  height: 200,
                  child: Center(
                    child: Text(
                      categoryNames[index],
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MealCategoryProvider>(
      builder: (context, mealCategoryProvider, _) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: generateCards(mealCategoryProvider.mealCategories.length),
          ),
        );
      },
    );
  }
}

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
  List<Widget> list = List<Widget>.generate(4, (index) {
    String meatTag = '';
    switch (index) {
      case 0:
        meatTag = 'Chicken';
        break;
      case 1:
        meatTag = 'Beef';
        break;
      case 2:
        meatTag = 'Pork';
        break;
      case 3:
        meatTag = 'Salmon';
        break;
    }
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.white,
      ),
      width: 250,
      height: 150,
      margin: const EdgeInsets.fromLTRB(25, 100, 25, 100),
      child: Stack(
        children: [
          Image.asset(HomeScreen.imagePaths[index]),
          Container(
            width: 60,
            height: 30,
            padding: const EdgeInsets.all(5),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20)),
              color: Colors.amber,
            ),
            child: Text(
              meatTag,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  });

  String searchValue = '';

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
                        () {
                      context.router.push(SplashRoute());
                    },
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
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: 175,
                        height: 55,
                        decoration: const BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(50),
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            'Recipe Suggestions',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
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
                                  onTap: () {},
                                ),
                                const SizedBox(height: 45, width: 20,),
                                FoodCard(
                                  imagePath: mealProvider.randomMealList[1].strMealThumb,
                                  text: mealProvider.randomMealList[1].strMeal,
                                  onTap: () {},
                                ),

                              ],
                            ),
                            Row(
                              children: [
                                const SizedBox(height: 65, width: 20,),
                                FoodCard(
                                  imagePath: mealProvider.randomMealList[2].strMealThumb,
                                  text: mealProvider.randomMealList[2].strMeal,
                                  onTap: () {},
                                ),
                                const SizedBox(height: 45, width: 20,),
                                FoodCard(
                                  imagePath: mealProvider.randomMealList[3].strMealThumb,
                                  text: mealProvider.randomMealList[3].strMeal,
                                  onTap: () {},
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
