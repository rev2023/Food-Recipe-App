import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Food_Recipe_App/provider/home_screen_provider.dart';
import 'package:Food_Recipe_App/provider/search_screen_provider.dart';
import 'package:Food_Recipe_App/router/app_router.gr.dart';
import 'package:Food_Recipe_App/styles/app_colors.dart';

class CarouselCard extends StatelessWidget {
  final List<String> imagePaths;
  final List<String> categoryNames;

  const CarouselCard(this.imagePaths, this.categoryNames, {Key? key})
      : super(key: key);

  List<Widget> generateCards(int length, BuildContext context) {
    return List<Widget>.generate(length, (index) {
      final searchMealProvider = Provider.of<SearchScreenProvider>(context);

      return GestureDetector(
        onTap: () {
          searchMealProvider.fetchCategoryData(categoryNames[index]);
          searchMealProvider.throughCategory = true;
          context.router.push(const DisplaySearchRoute());
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
                    color: AppColors.iconColor.withOpacity(0.4),
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
