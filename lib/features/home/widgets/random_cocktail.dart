import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class RandomCocktail extends StatelessWidget {
  final AsyncValue cocktail;

  const RandomCocktail({
    Key? key,
    required this.cocktail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return cocktail.when(
      data: (cocktails) {
        final item = cocktails[0];
        return Card(
          elevation: 5,
          child: Container(
            height: 50.h,
            width: 90.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: NetworkImage(item.strDrinkThumb),
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
                  child: Column(
                    children: [
                      SizedBox(
                        width: 80.w,
                        child: Center(
                          child: AutoSizeText(
                            item.strDrink,
                            maxLines: 2,
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.apply(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            item.strCategory,
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.apply(color: Colors.white),
                          ),
                          Text(
                            ' ▫️ ${item.strAlcoholic}',
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.apply(color: Colors.white),
                          ),
                          Text(
                            ' ▫️ ${item.strGlass}',
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
              ],
            ),
          ),
        );
      },
      error: (error, stack) {
        return Text(
          'Error loading cocktails:',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        );
      },
      loading: () => Shimmer.fromColors(
        baseColor: Theme.of(context).primaryColor.withOpacity(0.3),
        highlightColor: Theme.of(context).primaryColor.withOpacity(0.1),
        child: Card(
          elevation: 5,
          child: Container(
            height: 50.h,
            width: 90.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
