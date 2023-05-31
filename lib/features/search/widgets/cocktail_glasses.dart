import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CocktailGlasses extends StatelessWidget {
  final String title;
  final List list;

  const CocktailGlasses({
    Key? key,
    required this.title,
    required this.list,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        SizedBox(
          height: 1.h,
        ),
        SizedBox(
          height: 5.h,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: list.length,
              itemBuilder: (context, index) {
                final item = list[index];
                return Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(5.0),
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Theme.of(context).primaryColor.withOpacity(0.7),
                    ),
                  ),
                  child: Text(
                    item['item']!,
                  ),
                );
              }),
        ),
        SizedBox(
          height: 3.h,
        ),
      ],
    );
  }
}
