import 'package:flutter/material.dart';
import 'package:Food_Recipe_App/styles/app_colors.dart';

class FoodCard extends StatefulWidget {
  final String imagePath;
  final String text;
  final VoidCallback onTap;

  const FoodCard({super.key, required this.imagePath, required this.text, required this.onTap});

  @override
  State<FoodCard> createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTapDown: (_) {
        setState(() {
          isTapped = !isTapped;
        });
        widget.onTap();
      },
      splashColor: Colors.tealAccent,
      child: Stack(
        children: <Widget>[
          Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.secondaryColor,
              image: DecorationImage(
                image: NetworkImage(widget.imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.labelColor,
            ),
            height: 60,
            width: 160,
            margin: const EdgeInsets.fromLTRB(0, 130, 20, 30),
            child: Center(
              child: Text(
                widget.text,
                style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white70),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
