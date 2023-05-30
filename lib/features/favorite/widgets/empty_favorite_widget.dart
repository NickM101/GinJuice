import 'package:flutter/material.dart';
import 'package:ginjuice/core/routes/route_utils.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

import '../../../core/common/widgets/custom_elevated_button.dart';

class EmptyFavoriteWidget extends StatelessWidget {
  const EmptyFavoriteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          const Spacer(),
          Lottie.asset(
            'assets/json/empty.json',
          ),
          Text(
            'Create Your Dream Cocktail Collection!',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          SizedBox(
            height: 1.h,
          ),
          const Text(
            "It looks like your favorite cocktail list is empty. Start adding your beloved drinks and keep them close at hand!",
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 2.h,
          ),
          CustomElevatedButton(
            onPressed: () => context.goNamed(AppScreen.explore.routeName),
            text: 'Add to Favorites',
          ),
          const Spacer()
        ],
      ),
    );
  }
}
