import 'package:flutter/material.dart';
import 'package:ginjuice/core/routes/route_utils.dart';
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
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.favorite, size: 18.0),
                    ),
                    IconButton(
                      onPressed: () {
                        context.pushNamed(AppScreen.detail.routeName);
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
