import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

import '../../../core/common/widgets/custom_elevated_button.dart';

class CocktailNotFound extends StatelessWidget {
  const CocktailNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          const Spacer(),
          Lottie.asset('assets/json/empty.json', height: 40.h),
          Text(
            'Sorry, We Couldn\'t Find That Cocktail.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          SizedBox(
            height: 1.h,
          ),
          const Text(
            "We apologize, but it appears that the cocktail you're searching for is not available.",
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 2.h,
          ),
          CustomElevatedButton(
            onPressed: () {},
            text: 'Back to Search',
          ),
          const Spacer()
        ],
      ),
    );
  }
}
