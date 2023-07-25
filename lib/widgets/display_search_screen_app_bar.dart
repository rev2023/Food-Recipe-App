import 'package:Food_Recipe_App/router/app_router.gr.dart';
import 'package:Food_Recipe_App/widgets/search_bar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DisplayScreenAppBar extends StatelessWidget
    implements PreferredSizeWidget {

  final double _preferredSize = 80;
  @override
  Size get preferredSize =>
      Size.fromHeight(_preferredSize); // Preferred height for the AppBar

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
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: GestureDetector(
                child: Icon(Icons.arrow_back_outlined),
                onTap: () {
                  context.router.replace(
                    HomeRoute(),
                  );
                },
              ),
            ),
            Container(
                width: MediaQuery.of(context).size.width - 82,
                child: SearchBar()),
          ],
        ),
      ),
    );
  }
}
