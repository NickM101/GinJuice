import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class FavoriteCocktail extends StatelessWidget {
  final String imageUrl;
  final int heartCount;
  final String name;

  const FavoriteCocktail({
    Key? key,
    required this.imageUrl,
    required this.heartCount,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.all(8.0),
          padding: const EdgeInsets.all(4.0),
          height: 30.h,
          width: 40.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 4.0),
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: AutoSizeText(
            name,
            maxLines: 2,
            style: Theme.of(context).textTheme.titleSmall,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
