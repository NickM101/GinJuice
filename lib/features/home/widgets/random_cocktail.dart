import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ginjuice/features/intro/widgets/dot_indicator.dart';
import 'package:glass/glass.dart';
import 'package:sizer/sizer.dart';

class RandomCocktail extends StatelessWidget {
  const RandomCocktail({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
          height: 50.h,
          width: 90.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: const DecorationImage(
              image: NetworkImage(
                  "https://www.thecocktaildb.com/images/media/drink/4u0nbl1504352551.jpg"),
              fit: BoxFit.cover,
            ),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black.withOpacity(0.6),
              ],
            ),
          ),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
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
              Positioned(
                bottom: 12,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Column(
                    children: [
                      AutoSizeText(
                        'Tuxedo Cocktail',
                        maxLines: 1,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.apply(color: Colors.white),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '▫️ Ordinary Drink',
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.apply(color: Colors.white),
                          ),
                          Text(
                            ' ▫️ Alcoholic',
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.apply(color: Colors.white),
                          ),
                          Text(
                            ' ▫️ Cocktail glass',
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.apply(color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
