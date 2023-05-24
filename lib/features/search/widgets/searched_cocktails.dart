// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';

class SearchedCocktails extends StatelessWidget {
  final AsyncValue items;

  const SearchedCocktails({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return items.when(
      data: (cocktails) {
        return ListView.builder(
          itemCount: cocktails.length,
          itemBuilder: (context, index) {
            final cocktail = cocktails[index];
            return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                child: Row(
                  children: [
                    Card(
                      child: Image.network(
                        cocktail.strDrinkThumb,
                        height: 20.h,
                        width: 35.w,
                        fit: BoxFit.cover,
                        errorBuilder: (BuildContext context, Object exception,
                            StackTrace? stackTrace) {
                          return const Text('Failed to load image');
                        },
                      ),
                    ),
                    SizedBox(
                      width: 1.h,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_right),
                    )
                  ],
                ));
          },
        );
      },
      error: (err, stack) => Text('Error: $err'),
      loading: () => const CircularProgressIndicator(),
    );
  }
}
