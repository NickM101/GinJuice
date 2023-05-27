import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/common/widgets/custom_image.dart';

class CocktailFeed extends StatelessWidget {
  final AsyncValue cocktails;
  final String title;

  const CocktailFeed({
    Key? key,
    required this.cocktails,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return cocktails.when(
      data: (items) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            SizedBox(
              height: 30.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final cocktail = items[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Card(
                          color: const Color(0xd9d9d9),
                          child: cocktail['strDrinkThumb'] != null
                              ? CustomImage(
                                  src: cocktail['strDrinkThumb'],
                                  id: cocktail['idDrink'],
                                )
                              : _buildShimmerImage(),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          cocktail['strDrink'] ?? 'Drink Name',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text(
                          cocktail['strAlcoholic'] ?? 'Alcoholic',
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall
                              ?.apply(color: Theme.of(context).hintColor),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
      error: (err, stack) => Text(
        'Error loading cocktails:',
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
          color: Colors.red,
        ),
      ),
      loading: () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Shimmer.fromColors(
              baseColor: Theme.of(context).primaryColor.withOpacity(0.3),
              highlightColor: Theme.of(context).primaryColor.withOpacity(0.1),
              child: Container(
                height: 4.h,
                width: 30.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5, // Show a shimmer effect for a fixed number of items
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Shimmer.fromColors(
                        baseColor:
                            Theme.of(context).primaryColor.withOpacity(0.3),
                        highlightColor:
                            Theme.of(context).primaryColor.withOpacity(0.1),
                        child: Container(
                          height: 15.h,
                          width: 35.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Shimmer.fromColors(
                        baseColor:
                            Theme.of(context).primaryColor.withOpacity(0.3),
                        highlightColor:
                            Theme.of(context).primaryColor.withOpacity(0.1),
                        child: Container(
                          height: 3.h,
                          width: 10.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 2.0),
                      Shimmer.fromColors(
                        baseColor:
                            Theme.of(context).primaryColor.withOpacity(0.3),
                        highlightColor:
                            Theme.of(context).primaryColor.withOpacity(0.1),
                        child: Container(
                          height: 2.h,
                          width: 5.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShimmerImage() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        height: 30.h,
        width: 40.w,
        color: Colors.white,
      ),
    );
  }
}
