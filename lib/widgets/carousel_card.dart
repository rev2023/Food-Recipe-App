import 'package:Food_Recipe_App/provider/home_screen_provider.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/search_screen_provider.dart';
import '../router/app_router.gr.dart';

class CarouselCard extends StatelessWidget {
  final List<String> imagePaths;
  final List<String> categoryNames;



  CarouselCard(this.imagePaths,  this.categoryNames, {super.key});


  List<Widget> generateCards(int length, BuildContext context) {

    return List<Widget>.generate(length, (index) {
      final searchMealProvider = Provider.of<SearchMealProvider>(context,);

      return GestureDetector(
        onTap: () {
          print(categoryNames[index]);
          searchMealProvider.fetchCategoryData(categoryNames[index]);
          context.router.push(DisplaySearchRoute());

        },

        child: Container(
          margin: const EdgeInsets.fromLTRB(25, 50, 15, 100),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Card(
            elevation: 10, // Remove default card shadow
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
                    color: Colors.black.withOpacity(0.4), // Dark tint color
                  ),
                  width: 250,
                  height: 200,
                  child: Center(
                    child: Text(
                      categoryNames[index],
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
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
    return Consumer<HomeScreenProvider>(
      builder: (context, mealProvider, _) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: generateCards(mealProvider.mealCategories.length, context),
          ),
        );
      },
    );
  }
}
