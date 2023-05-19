import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:glass/glass.dart';
import 'package:sizer/sizer.dart';

class CoverImageWithText extends StatelessWidget {
  const CoverImageWithText({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h, // Adjust the height as needed
      width: double.infinity,
      child: Stack(
        // fit: StackFit.expand,
        children: [
          // Cover Image
          Image.network(
            'https://www.thecocktaildb.com/images/media/drink/x894cs1504388670.jpg',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          // Faded Black Background
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.6),
                ],
              ),
            ),
          ),
          // Text Overlaid at the Bottom
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  "Screaming Orgasm",
                  maxLines: 2,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
