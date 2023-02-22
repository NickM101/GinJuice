import 'package:flutter/material.dart';

class CocktailGallery extends StatelessWidget {
  const CocktailGallery({Key? key}) : super(key: key);

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
            Ink.image(
              image: const NetworkImage(
                  "https://www.thecocktaildb.com/images/media/drink/tqyrpw1439905311.jpg"),
              height: 300,
              fit: BoxFit.cover,
              child: InkWell(
                onTap: () => print('Card Selected'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Long Island',
                    style: TextStyle(color: Colors.white),
                  ),
                  IconButton(
                    onPressed: () => {print("Favorite Clicked")},
                    icon: const Icon(
                      Icons.favorite,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            const Positioned(
              bottom: 0.0,
              right: 0.0,
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  'Non-Alcoholic',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
