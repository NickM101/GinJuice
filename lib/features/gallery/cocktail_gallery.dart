import 'package:flutter/material.dart';

class CocktailGallery extends StatelessWidget {
  const CocktailGallery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.4),
            spreadRadius: 2,
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        children: [
          Hero(
              tag: 'io',
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(10.0),
                    topLeft: Radius.circular(10.0)),
                child: Image.network(
                  height: 150,
                  width: 200,
                  "https://www.thecocktaildb.com/images/media/drink/dztcv51598717861.jpg",
                  fit: BoxFit.fill,
                ),
              )),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Cocktail",
            style: Theme.of(context)
                .textTheme
                .labelLarge
                ?.apply(fontWeightDelta: 300),
          )
        ],
      ),
    );
  }
}
