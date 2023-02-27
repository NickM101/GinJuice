import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ginjuice/models/cocktail.dart';
import 'package:ginjuice/pages/Home/cocktail_page.dart';

class CocktailGallery extends StatelessWidget {
  final Cocktail cocktail;
  const CocktailGallery({Key? key, required this.cocktail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 5,
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Colors.black87,
          Colors.transparent,
          Colors.transparent,
          Colors.black45,
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
              child: Container(),
            ),
            Hero(
              tag: '${cocktail.idDrink}',
              child: GestureDetector(
                onTap: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              CocktailPage(cocktail: cocktail))),
                },
                child: Image.network(
                  '${cocktail.strDrinkThumb}',
                  height: 400,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 120,
                    child: Text(
                      '${cocktail.strDrink}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  IconButton(
                    onPressed: () => {print("Favorite Clicked")},
                    icon: const Icon(
                      Icons.favorite_border_rounded,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
