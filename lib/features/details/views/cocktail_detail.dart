import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ginjuice/core/routes/route_utils.dart';
import 'package:ginjuice/features/details/controllers/recipe_controller.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

import '../../../core/common/models/cocktail_model.dart';

class CocktailDetail extends ConsumerWidget {
  final CocktailModel item;

  const CocktailDetail({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipeController = ref.watch(recipeProvider);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => context.pop(),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                Colors.black26), // Set the background color here
          ),
          icon: const Icon(
            Icons.clear,
            color: Colors.white,
            fill: 0.5,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // TODO - replace container with card, elevation 5 + good padding
          DetailCardImage(item: item),
          SizedBox(
            height: 2.h,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Ingredients'),
          ),
          Expanded(
            flex: 2,
            child: GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              padding: const EdgeInsets.all(8.0),
              mainAxisSpacing: 1.0, // Adjust the spacing between the rows
              crossAxisSpacing: 8.0, // Adjust the spacing between the columns
              childAspectRatio: 1.8,
              children: recipeController.processIngredients(item),
            ),
          ),
          Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      context.pushNamed(AppScreen.steps.routeName, extra: item);
                    },
                    style: ElevatedButton.styleFrom(fixedSize: Size(60.w, 8.h)),
                    child: const Text('Start Mixing'),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}

class DetailCardImage extends StatelessWidget {
  const DetailCardImage({
    super.key,
    required this.item,
  });

  final CocktailModel item;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: double.infinity,
      decoration: BoxDecoration(
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
    );
  }
}
