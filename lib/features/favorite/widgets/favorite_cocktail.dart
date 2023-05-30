import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ginjuice/core/common/models/cocktail_model.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

import '../../../core/common/widgets/custom_image.dart';
import '../../../core/routes/route_utils.dart';

class FavoriteCocktail extends StatelessWidget {
  final CocktailModel item;

  const FavoriteCocktail({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () => context.pushNamed(
            AppScreen.detail.routeName,
            extra: item,
          ),
          child: Container(
            margin: const EdgeInsets.all(3.0),
            padding: const EdgeInsets.all(2.0),
            height: 30.h,
            width: 45.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: CustomImage(
                src: item.strDrinkThumb,
                id: item.idDrink,
              ),
            ),
          ),
        ),
        const SizedBox(height: 4.0),
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: AutoSizeText(
            item.strDrink,
            maxLines: 2,
            style: Theme.of(context).textTheme.titleSmall,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
