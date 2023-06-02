import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ginjuice/features/search/controllers/search_controller.dart';
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
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Spacer(),
                            Consumer(
                              builder: (BuildContext context, WidgetRef ref,
                                  Widget? child) {
                                return InkWell(
                                  onTap: () => ref
                                      .read(searchControllerProvider.notifier)
                                      .clearSelectedItems(),
                                  child: Text(
                                    'Clear search results',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall
                                        ?.apply(
                                            decoration:
                                                TextDecoration.underline),
                                  ),
                                );
                              },
                            )
                          ],
                        ),
                        Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: history.length,
                            itemBuilder: (context, index) {
                              final favorite = history[index];
                              return FavoriteCocktail(
                                item: favorite,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 4.h,
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
