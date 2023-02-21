import 'package:flutter/material.dart';

class CocktailGallery extends StatelessWidget {
  const CocktailGallery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {print("Card Selected")},
      child: Container(
        height: 300,
        padding: const EdgeInsets.only(right: 5, left: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.transparent, Colors.black54],
          ),
          image: const DecorationImage(
              image: NetworkImage(
                  "https://www.thecocktaildb.com/images/media/drink/tqyrpw1439905311.jpg"),
              fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            Row(
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
          ],
        ),
      ),
    );
  }
}
