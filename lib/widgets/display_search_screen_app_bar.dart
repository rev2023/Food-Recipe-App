import 'package:Food_Recipe_App/router/app_router.gr.dart';
import 'package:Food_Recipe_App/widgets/search_bar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../styles/app_colors.dart';

class DisplayScreenAppBar extends StatelessWidget
    implements PreferredSizeWidget {

  final double _preferredSize = 80;

  const DisplayScreenAppBar({super.key});
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
        backgroundColor: AppColors.primaryColor,
        toolbarHeight: 80,
        shadowColor: AppColors.primaryColor,
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: GestureDetector(
                child: const Icon(Icons.arrow_back_outlined),
                onTap: () {
                  context.router.replace(
                    const HomeRoute(),
                  );
                },
              ),
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width - 82,
                child: SearchBar()),
          ],
        ),
      ),
    );
  }
}
