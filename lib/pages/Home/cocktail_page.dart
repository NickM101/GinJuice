import 'package:flutter/material.dart';
import 'package:ginjuice/models/cocktail.dart';

class CocktailPage extends StatelessWidget {
  final Cocktail cocktail;

  const CocktailPage({Key? key, required this.cocktail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: '${cocktail.idDrink}',
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: const BackButton(
            color: Colors.white70,
          ),
        ),
        body: Image.network('${cocktail.strDrinkThumb}', fit: BoxFit.cover),
        bottomNavigationBar: Container(
          height: MediaQuery.of(context).size.height / 1.8,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xFF2C1C34), Color(0XFF16151D)],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40))),
        ),
      ),
    );
  }
}
