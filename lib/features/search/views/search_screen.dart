import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ginjuice/features/favorite/controllers/favorite_controller.dart';
import 'package:ginjuice/features/search/views/search_empty_screen.dart';
import 'package:ginjuice/features/search/widgets/cocktail_not_found.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

import '../../../core/common/widgets/custom_image.dart';
import '../../../core/routes/route_utils.dart';
import '../controllers/search_controller.dart';

class SearchScreen extends ConsumerWidget {
  const SearchScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = ref.watch(searchControllerProvider);
    final historySearch = ref.read(searchControllerProvider.notifier).items;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: TextField(
              keyboardType: TextInputType.text,
              controller: TextEditingController(
                  text:
                      ref.watch(searchControllerProvider.notifier).searchQuery),
              textInputAction: TextInputAction.search,
              onChanged: (value) =>
                  ref.read(searchControllerProvider.notifier).updateText(value),
              onSubmitted: (value) {
                ref
                    .read(searchControllerProvider.notifier)
                    .performSearch(value, context);
              },
              decoration: InputDecoration(
                label: const Text('Find Your Perfect Cocktail'),
                filled: true,
                hintText: 'margarita...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  onPressed: () {
                    // TODO: Store textfield value for history search feed
                    ref.read(searchControllerProvider.notifier).clearSearch();
                  },
                  icon: const Icon(Icons.clear),
                ),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
              ),
            ),
          ),
          Expanded(
            child: searchController.when(
              error: (error, stackTrace) => const CocktailNotFound(),
              loading: () => const Center(child: CircularProgressIndicator()),
              data: (results) {
                if (results.isEmpty) {
                  return SearchEmptyScreen(history: historySearch);
                } else {
                  return ListView.builder(
                    itemCount: results.length,
                    addAutomaticKeepAlives: false,
                    addRepaintBoundaries: false,
                    itemBuilder: (context, index) {
                      final cocktail = results[index];
                      return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Card(
                                color: Theme.of(context).primaryColor,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Name:',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelSmall,
                                        ),
                                        Text(cocktail.strDrink),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Type:',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelSmall,
                                        ),
                                        Text(cocktail.strAlcoholic!),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Glass:',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelSmall,
                                        ),
                                        Text(cocktail.strGlass!),
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
                                    final active = ref
                                        .watch(favoriteProvider)
                                        .isFavorite(cocktail);
                                    final favoriteAction =
                                        ref.read(favoriteProvider.notifier);
                                    return IconButton(
                                      onPressed: () {
                                        active
                                            ? favoriteAction
                                                .removeFromFavorites(cocktail)
                                            : favoriteAction
                                                .addToFavorites(cocktail);
                                      },
                                      icon: active
                                          ? const Icon(Icons.favorite,
                                              size: 18.0)
                                          : const Icon(
                                              Icons.favorite_border_outlined,
                                              size: 18.0),
                                      color: active
                                          ? Colors.red
                                          : Theme.of(context).primaryColor,
                                    );
                                  }),
                                  IconButton(
                                    onPressed: () {
                                      context.pushNamed(
                                        AppScreen.detail.routeName,
                                        extra: cocktail,
                                      );
                                      ref
                                          .read(
                                              searchControllerProvider.notifier)
                                          .saveSelectedItem(cocktail);
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
              },
            ),
          ),
        ],
      ),
    );
  }
}
