import 'package:auto_route/auto_route.dart';

import 'app_router.gr.dart';


@AutoRouterConfig()
class AppRouter extends $AppRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(path: '/screens/splash_screen.dart', page: SplashRoute.page, initial: false),
    AutoRoute(path: '/screens/home_screen.dart', page: HomeRoute.page, initial: true,),
    AutoRoute(path: '/screens/recipe_screen.dart', page: RecipeRoute.page),






  ];
}