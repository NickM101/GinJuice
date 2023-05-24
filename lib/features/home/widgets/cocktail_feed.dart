import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';

class CocktailFeed extends StatelessWidget {
  final AsyncValue cocktails;
  final String title;

  const CocktailFeed({
    Key? key,
    required this.cocktails,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return cocktails.when(
      data: (items) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            SizedBox(
              height: 30.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final cocktail = items[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Card(
                          child: Image.network(
                            cocktail['strDrinkThumb'],
                            width: 35.w,
                            height: 20.h,
                            fit: BoxFit.cover,
                            errorBuilder: (BuildContext context,
                                Object exception, StackTrace? stackTrace) {
                              return Text('Failed to load image');
                            },
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          cocktail['strDrink'],
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text(
                          cocktail['strAlcoholic'],
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall
                              ?.apply(color: Theme.of(context).hintColor),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
      error: (err, stack) => Text('Error: $err'),
      loading: () => const CircularProgressIndicator(),
    );
  }
}
