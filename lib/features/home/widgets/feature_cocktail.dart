import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ginjuice/features/intro/widgets/dot_indicator.dart';
import 'package:glass/glass.dart';
import 'package:sizer/sizer.dart';

class FeatureCocktail extends StatelessWidget {
  const FeatureCocktail({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.h,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              "https://www.thecocktaildb.com/images/media/drink/5noda61589575158.jpg"), // Replace with your own avatar image path
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 20,
            left: 12,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Featured Recipes',
                      style: Theme.of(context).textTheme.labelLarge),
                  SizedBox(width: 2.h),
                  AutoSizeText(
                    'Magarita',
                    maxLines: 2,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ],
              ),
            ).asGlass(
              tintColor: Colors.black,
              clipBorderRadius: BorderRadius.circular(10),
            ),
          ),
          Positioned(
            bottom: 16,
            left: 12,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://www.thecocktaildb.com/images/media/drink/5noda61589575158.jpg"), // Replace with your own avatar image path
                    ),
                    const SizedBox(width: 8),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(3, 0, 10, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'John Doe',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.apply(
                                    fontWeightDelta: 900, color: Colors.white),
                          ),
                          Text(
                            'Timeline',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.apply(
                                    fontWeightDelta: 300, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ).asGlass(
                  tintColor: Colors.black,
                  clipBorderRadius: BorderRadius.circular(15),
                ),
                SizedBox(
                  width: 26.h,
                ),
                ...List.generate(
                  4,
                  (index) => Padding(
                    padding: const EdgeInsets.only(right: 4.0),
                    child: DotIndicator(
                      color: Colors.white,
                      isActive: index == 2,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}