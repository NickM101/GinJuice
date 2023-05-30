import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ginjuice/core/common/widgets/custom_elevated_button.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

import '../../../core/common/models/cocktail_model.dart';
import '../../../core/routes/route_utils.dart';
import '../controllers/recipe_controller.dart';
import '../widgets/detail_card_image.dart';

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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Ingredients'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          DetailCardImage(item: item),
          SizedBox(
            height: 2.h,
          ),
          Expanded(
            flex: 2,
            child: GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              padding: const EdgeInsets.all(8.0),
              mainAxisSpacing: 1.0,
              crossAxisSpacing: 8.0,
              childAspectRatio: 1.8,
              children: recipeController.processIngredients(item),
            ),
          ),
          Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: CustomElevatedButton(
                  onPressed: () {
                    context.pushNamed(AppScreen.steps.routeName, extra: item);
                  },
                  text: 'Start Mixing',
                ),
              ))
        ],
      ),
    );
  }
}
