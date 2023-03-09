import 'package:flutter/material.dart';

class SearchHistory extends StatelessWidget {
  const SearchHistory({Key? key}) : super(key: key);
  //item $index
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: Chip(
                label: Text('item $index'),
                elevation: 2,
                deleteIcon: Icon(Icons.clear),
              ),
            );
          }),
    );
  }
}
