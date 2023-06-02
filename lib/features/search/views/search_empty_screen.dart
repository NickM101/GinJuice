import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

import '../../../core/common/models/cocktail_model.dart';
import '../../../core/data/cocktail_data.dart';
import '../../favorite/widgets/favorite_cocktail.dart';
import '../widgets/cocktail_glasses.dart';

class SearchEmptyScreen extends StatelessWidget {
  const SearchEmptyScreen({
    Key? key,
    required this.history,
  }) : super(key: key);

  final List<CocktailModel> history;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.topCenter,
              child: Stack(
                children: [
                  Visibility(
                    visible: history.isEmpty,
                    child: Column(
                      children: [
                        Lottie.asset('assets/json/turbine_empty.json',
                            height: 18.h),
                        Text(
                          'Explore by cocktail name to quickly find your desired drink.',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Divider(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8.0,
                                vertical: 10.0,
                              ),
                              child: Text(
                                'or',
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                thickness: 1.0,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'Discover by Glass, Category, or Alcohol Type',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: history.isNotEmpty,
                    child: Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: history.length,
                        addAutomaticKeepAlives: false,
                        addRepaintBoundaries: false,
                        itemBuilder: (context, index) {
                          final favorite = history[index];
                          return FavoriteCocktail(
                            item: favorite,
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SearchOptions(),
        ],
      ),
    );
  }
}

class SearchOptions extends StatelessWidget {
  const SearchOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CocktailGlasses(
              title: 'Glasses',
              list: cocktailGlasses,
            ),
            CocktailGlasses(
              title: 'Category',
              list: cocktailCategory,
            ),
            CocktailGlasses(
              title: 'Type',
              list: cocktailType,
            ),
          ],
        ),
      ),
    );
  }
}
