import 'package:auto_route/auto_route.dart';

import 'app_router.gr.dart';


@AutoRouterConfig()
class AppRouter extends $AppRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(path: '/screens/splash_screen.dart', page: SplashRoute.page, initial: true),
    AutoRoute(path: '/screens/home_screen.dart', page: HomeRoute.page),
    AutoRoute(path: '/screens/recipe_screen.dart', page: RecipeRoute.page),
    AutoRoute(path: '/screens/display_search_screen.dart', page: DisplaySearchRoute.page,),







  ];
}