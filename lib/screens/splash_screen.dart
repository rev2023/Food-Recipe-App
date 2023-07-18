import 'package:flutter/cupertino.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:food_app/Screens/home_screen.dart';
import 'package:food_app/models/meal_category.dart';
import 'package:food_app/models/recipe.dart';
import 'package:food_app/repository/meal_category_repository.dart';
import 'package:food_app/router/app_router.gr.dart';
import 'package:food_app/services/api/meal_category_api.dart';
import 'package:food_app/widgets/food_card.dart';
import 'package:provider/provider.dart';
import '../widgets/carousel_card.dart';
import '../widgets/search_bar.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  initState(){
    super.initState();
    _navigateToHome();

  }
  @override
  void dispose() {
    // Cancel any active work or clean up resources here
    super.dispose();
  }

   _navigateToHome() async{
    await Future.delayed(Duration(milliseconds: 1500));
    if (mounted) {
      context.router.replace(HomeRoute());
    }  }
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Container(
      height: screenHeight,
      width: screenWidth,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        colors: [
          Colors.amber,
          Colors.orangeAccent,
          Colors.yellow,
          Colors.greenAccent
        ],
      )),
      child: Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: screenHeight / 2.5, bottom: 50),
              child: Image.asset(
                'lib/images/logo.png',
              ),
              height: 150,
            ),
            Text(
              'Your food recipe directory',
              style: TextStyle(
                  color: Colors.black54,
                  fontStyle: FontStyle.italic,
                  fontSize: 20,
                  fontWeight: FontWeight.bold

              ),
            )
          ],
        ),
      ),
    ));
  }
}
