import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final alphabetProvider = Provider<List<String>>((ref) => [
      'A',
      'B',
      'C',
      'D',
      'E',
      'F',
      'G',
      'H',
      'I',
      'J',
      'K',
      'L',
      'M',
      'N',
      'O',
      'P',
      'Q',
      'R',
      'S',
      'T',
      'U',
      'V',
      'W',
      'X',
      'Y',
      'Z'
    ]);

final networkImagesProvider = FutureProvider<List<Image>>((ref) async {
  // Simulating fetching network images
  // Replace this with your actual logic to fetch the images
  await Future.delayed(Duration(seconds: 2));

  return [
    Image.network(
        "https://www.thecocktaildb.com/images/media/drink/5noda61589575158.jpg"),
    Image.network(
        "https://www.thecocktaildb.com/images/media/drink/bry4qh1582751040.jpg"),
    Image.network(
        "https://www.thecocktaildb.com/images/media/drink/loezxn1504373874.jpg"),
  ];
});
