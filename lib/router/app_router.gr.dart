// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/cupertino.dart' as _i7;
import 'package:Food_Recipe_App/models/meal.dart' as _i6;
import 'package:Food_Recipe_App/screens/display_search_screen.dart' as _i1;
import 'package:Food_Recipe_App/screens/home_screen.dart' as _i2;
import 'package:Food_Recipe_App/screens/recipe_screen.dart' as _i3;
import 'package:Food_Recipe_App/screens/splash_screen.dart' as _i4;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    DisplaySearchRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.DisplaySearchScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child:  _i2.HomeScreen(),
      );
    },
    RecipeRoute.name: (routeData) {
      final args = routeData.argsAs<RecipeRouteArgs>();
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.RecipeScreen(args.meal),
      );
    },
    SplashRoute.name: (routeData) {
      final args = routeData.argsAs<SplashRouteArgs>(
          orElse: () => const SplashRouteArgs());
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.SplashScreen(key: args.key),
      );
    },
  };
}

/// generated route for
/// [_i1.DisplaySearchScreen]
class DisplaySearchRoute extends _i5.PageRouteInfo<void> {
  const DisplaySearchRoute({List<_i5.PageRouteInfo>? children})
      : super(
          DisplaySearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'DisplaySearchRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute({List<_i5.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i3.RecipeScreen]
class RecipeRoute extends _i5.PageRouteInfo<RecipeRouteArgs> {
  RecipeRoute({
    required _i6.Meal meal,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          RecipeRoute.name,
          args: RecipeRouteArgs(meal: meal),
          initialChildren: children,
        );

  static const String name = 'RecipeRoute';

  static const _i5.PageInfo<RecipeRouteArgs> page =
      _i5.PageInfo<RecipeRouteArgs>(name);
}

class RecipeRouteArgs {
  const RecipeRouteArgs({required this.meal});

  final _i6.Meal meal;

  @override
  String toString() {
    return 'RecipeRouteArgs{meal: $meal}';
  }
}

/// generated route for
/// [_i4.SplashScreen]
class SplashRoute extends _i5.PageRouteInfo<SplashRouteArgs> {
  SplashRoute({
    _i7.Key? key,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          SplashRoute.name,
          args: SplashRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i5.PageInfo<SplashRouteArgs> page =
      _i5.PageInfo<SplashRouteArgs>(name);
}

class SplashRouteArgs {
  const SplashRouteArgs({this.key});

  final _i7.Key? key;

  @override
  String toString() {
    return 'SplashRouteArgs{key: $key}';
  }
}
