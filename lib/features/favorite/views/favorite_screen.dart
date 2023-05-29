import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';

import '../../../core/common/models/cocktail_model.dart';
import '../controllers/favorite_controller.dart';
import '../widgets/favorite_cocktail.dart';

// ignore: must_be_immutable
class FavoriteScreen extends ConsumerWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteController = ref.watch(favoriteProvider);
    List<CocktailModel> favorites = favoriteController.favoriteItems;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Favorites'),
      ),
      body: Stack(
        children: [
          Visibility(
            visible: favorites.isEmpty,
            child: Container(
              alignment: Alignment.center,
              child: Text('Empty State'),
            ),
          ),
          Visibility(
            visible: favorites.isNotEmpty,
            child: favoriteList(favorites),
          ),
        ],
      ),
    );
  }

  Padding favoriteList(List<CocktailModel> favorites) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 9,
            child: GridView.builder(
              itemCount: favorites.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 30.w / 38.h,
              ),
              itemBuilder: (context, index) {
                final favorite = favorites[index];
                return FavoriteCocktail(
                  item: favorite,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
