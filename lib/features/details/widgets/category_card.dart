import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String name;
  final List<String> ingredients;
  final String oz;

  const CategoryCard({
    Key? key,
    required this.name,
    required this.ingredients,
    required this.oz,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: ingredients
                  .where((ingredient) => ingredient.isNotEmpty)
                  .map((ingredient) => Text('$oz $ingredient'))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
