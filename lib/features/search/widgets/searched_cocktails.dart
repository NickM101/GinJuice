// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/common/widgets/cocktail_list_widget.dart';

class SearchedCocktails extends StatelessWidget {
  final AsyncValue value;

  const SearchedCocktails({
    Key? key,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: (data) => CocktailList(items: data),
      error: (error, stackTrace) => Text(error.toString()),
      loading: () => const CircularProgressIndicator(),
    );
  }
}
