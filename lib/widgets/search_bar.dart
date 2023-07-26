import 'package:Food_Recipe_App/provider/search_screen_provider.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Food_Recipe_App/router/app_router.gr.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';
import 'package:provider/provider.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<SearchBar> {
  static FloatingSearchBarController controller = FloatingSearchBarController();

  @override
  void initState() {
    super.initState();
    // Call the controller.open() inside initState to open the search bar at start
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.open();
    });
  }

  @override
  Widget build(BuildContext context) {
    return buildFloatingSearchBar(context);
  }

  Widget buildFloatingSearchBar(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Container(
      width: 120,
      height: 90,
      margin: const EdgeInsets.only(bottom: 20,),
      child: FloatingSearchBar(
        automaticallyImplyBackButton: false,
        controller: controller,
        hint: 'Search...',
        scrollPadding: const EdgeInsets.only(top: 16, bottom: 50),
        transitionDuration: const Duration(milliseconds: 800),
        transitionCurve: Curves.easeInOut,
        physics: const BouncingScrollPhysics(),
        axisAlignment: isPortrait ? 0.0 : -1.0,
        openAxisAlignment: 0.0,
        width: isPortrait ? 600 : 500,
        debounceDelay: const Duration(milliseconds: 500),
        onQueryChanged: (query) {
          // Handle search query changes here
        },
        onSubmitted: (query) {
          SearchMealProvider searchMealProvider = Provider.of<SearchMealProvider>(context, listen: false);
          searchMealProvider.query = query;
          searchMealProvider.fetchSearchData();
          context.router.push(const DisplaySearchRoute());
          firstTime = false;
        },
        transition: CircularFloatingSearchBarTransition(),
        actions: [
          FloatingSearchBarAction(
            showIfOpened: false,
            child: CircularButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
          ),
          FloatingSearchBarAction.searchToClear(
            showIfClosed: false,
          ),
        ],
        builder: (context, transition) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Material(
              color: Colors.white,
              elevation: 4.0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: Colors.accents.map((color) {
                  return Container(height: 112, color: color);
                }).toList(),
              ),
            ),
          );
        },
      ),
    );
  }
}
