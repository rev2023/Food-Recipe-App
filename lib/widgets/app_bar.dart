import 'package:Food_Recipe_App/router/app_router.gr.dart';
import 'package:Food_Recipe_App/widgets/search_bar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize =>
      const Size.fromHeight(80); // Preferred height for the AppBar
  final searchBar = SearchBar();

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.amber,
        toolbarHeight: 80,
        shadowColor: Colors.amber,
        title: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 50),
              child: Image.asset(
                'lib/images/logo.png',
                width: 80,
                height: 50,
              ),
            ),
            GestureDetector(
                onTap: () {
                  context.router.push(const DisplaySearchRoute());
                },
                child: Container(
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width - 220),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
