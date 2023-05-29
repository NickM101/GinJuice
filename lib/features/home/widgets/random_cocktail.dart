import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ginjuice/core/routes/route_utils.dart';
import 'package:ginjuice/features/details/widgets/detail_card_image.dart';
import 'package:go_router/go_router.dart';
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
        return InkWell(
            onTap: () => context.pushNamed(
                  AppScreen.detail.routeName,
                  extra: item,
                ),
            child: DetailCardImage(item: item));
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
