import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/common/models/cocktail_model.dart';

class FavoriteController extends ChangeNotifier {
  List<CocktailModel> favoriteItems = [];

  void addToFavorites(CocktailModel item) {
    favoriteItems.add(item);
    notifyListeners();
  }

  void removeFromFavorites(CocktailModel item) {
    favoriteItems.remove(item);
    notifyListeners();
  }
}

final favoriteProvider = ChangeNotifierProvider((ref) => FavoriteController());
