import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class CocktailGlasses extends StatelessWidget {
  CocktailGlasses({super.key});

  List<Map<String, String>> cocktailGlasses = [
    {"strGlass": "Highball glass"},
    {"strGlass": "Cocktail glass"},
    {"strGlass": "Old-fashioned glass"},
    {"strGlass": "Whiskey Glass"},
    {"strGlass": "Collins glass"},
    {"strGlass": "Pousse cafe glass"},
    {"strGlass": "Champagne flute"},
    {"strGlass": "Whiskey sour glass"},
    {"strGlass": "Cordial glass"},
    {"strGlass": "Brandy snifter"},
    {"strGlass": "White wine glass"},
    {"strGlass": "Nick and Nora Glass"},
    {"strGlass": "Hurricane glass"},
    {"strGlass": "Coffee mug"},
    {"strGlass": "Shot glass"},
    {"strGlass": "Jar"},
    {"strGlass": "Irish coffee cup"},
    {"strGlass": "Punch bowl"},
    {"strGlass": "Pitcher"},
    {"strGlass": "Pint glass"},
    {"strGlass": "Copper Mug"},
    {"strGlass": "Wine Glass"},
    {"strGlass": "Beer mug"},
    {"strGlass": "Margarita/Coupette glass"},
    {"strGlass": "Beer pilsner"},
    {"strGlass": "Beer Glass"},
    {"strGlass": "Parfait glass"},
    {"strGlass": "Mason jar"},
    {"strGlass": "Margarita glass"},
    {"strGlass": "Martini Glass"},
    {"strGlass": "Balloon Glass"},
    {"strGlass": "Coupe Glass"}
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      scrollDirection: Axis.horizontal,
      mainAxisSpacing: 8.0,
      childAspectRatio: 0.4,
      children: List.generate(cocktailGlasses.length, (index) {
        final glasses = cocktailGlasses[index];
        return InkWell(
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          onTap: () => print('glasses -- ${glasses['strGlass']}'),
          child: Chip(
            label: Text(glasses['strGlass']!),
          ),
        );
      }),
    );
  }
}
