import 'package:flutter/material.dart';
import 'package:ginjuice/models/glass.dart';

class GlassTypes extends StatelessWidget {
  const GlassTypes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Glass.glasses.length,
      itemBuilder: (BuildContext context, index) {
        return Container(
          child: Stack(
            children: [
              Image.asset(Glass.glasses[index].image),
              Text(Glass.glasses[index].name)
            ],
          ),
        );
      },
    );
  }
}
