import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

import 'package:ginjuice/core/common/models/cocktail_model.dart';

import '../../../core/common/widgets/custom_elevated_button.dart';
import '../../../core/data/cocktail_data.dart';
import '../../../core/routes/route_utils.dart';
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
          const EmptySearchHistory(),
          SizedBox(
            height: 4.h,
          ),
          const SearchOptions(),
        ],
      ),
    );
  }
}

class EmptySearchHistory extends StatelessWidget {
  const EmptySearchHistory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Lottie.asset('assets/json/turbine_empty.json', height: 18.h),
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
