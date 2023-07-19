import 'package:Food_Recipe_App/widgets/search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(80); // Preferred height for the AppBar

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: AppBar(
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
            Expanded(
              child: SearchBar(),
            ),
          ],
        ),
      ),
    );
  }
}
