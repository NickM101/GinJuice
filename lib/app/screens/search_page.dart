import 'package:flutter/material.dart';
import 'package:ginjuice/features/gallery/pick_of_the_day.dart';
import 'package:ginjuice/features/search/search_bar.dart';
import 'package:ginjuice/features/search/search_history.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 50.0,
          ),
          SearchBar(),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text('History'), Text('12 items')],
          ),
          SearchHistory(),
          SizedBox(
            height: 20,
          ),
          Text("Top Pick Of The Day"),
          SizedBox(
            height: 20,
          ),
          PickOfTheDay(),
          SizedBox(
            height: 20,
          ),
          Text("Glass Type"),
          // GlassTypes()
        ],
      ),
    );
  }
}
