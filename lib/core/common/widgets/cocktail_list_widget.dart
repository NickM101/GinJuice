import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ginjuice/core/routes/route_utils.dart';
import 'package:ginjuice/features/favorite/controllers/favorite_controller.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

import 'custom_image.dart';

class CocktailList extends StatelessWidget {
  final List items;

  const CocktailList({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final cocktail = items[index];
        return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  color: const Color(0xd9d9d9),
                  child: CustomImage(
                    src: cocktail.strDrinkThumb,
                    id: cocktail.idDrink,
                  ),
                ),
                SizedBox(
                  width: 1.h,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 2.h,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Name:',
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                          Text(cocktail.strDrink),
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Type:',
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                          Text(cocktail.strAlcoholic),
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Glass:',
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                          Text(cocktail.strGlass),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Consumer(builder: (
                      BuildContext context,
                      WidgetRef ref,
                      Widget? child,
                    ) {
                      final active =
                          ref.watch(favoriteProvider).isFavorite(cocktail);
                      final favoriteAction =
                          ref.read(favoriteProvider.notifier);
                      return IconButton(
                        onPressed: () {
                          active
                              ? favoriteAction.removeFromFavorites(cocktail)
                              : favoriteAction.addToFavorites(cocktail);
                        },
                        icon: active
                            ? const Icon(Icons.favorite, size: 18.0)
                            : const Icon(Icons.favorite_border_outlined,
                                size: 18.0),
                        color: active ? Colors.red : Colors.black,
                      );
                    }),
                    IconButton(
                      onPressed: () {
                        context.pushNamed(
                          AppScreen.detail.routeName,
                          extra: cocktail,
                        );
                      },
                      icon: const Icon(Icons.arrow_right),
                    ),
                  ],
                )
              ],
            ));
      },
    );
  }
}
