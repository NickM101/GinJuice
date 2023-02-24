import 'package:flutter/material.dart';
import 'package:ginjuice/models/cocktail.dart';
import 'package:ginjuice/pages/Home/widgets/cocktail_gallery.dart';

import '../../data/cocktail_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int paneProportion = 100;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Left Column
        Container(
          width: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text('Button 1'),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Button 2'),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Button 3'),
              ),
            ],
          ),
        ),
        // Right Column
        Expanded(
          child: ListView.builder(
            itemCount: CocktailData.drinks.length,
            itemBuilder: (BuildContext context, int index) {
              final item = CocktailData.drinks[index];
              final cocktail =
                  Cocktail.fromMap(item); // convert Map to CocktailData
              return ListTile(title: CocktailGallery(cocktail: cocktail));
            },
          ),
        ),
      ],
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Flex(
  //     direction: Axis.horizontal,
  //     children: [
  //       Flexible(
  //         flex: 2 - paneProportion,
  //         child: PaneLeft(),
  //       ),
  //       Flexible(flex: paneProportion, child: PaneRight())
  //     ],
  //   );
  // }
  //
  // Widget PaneLeft() {
  //   return Column(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     // crossAxisAlignment: CrossAxisAlignment.start,
  //     children: const [
  // TrapezoidButton(text: 'Shot', icon: Icons.adb_sharp),
  //     ],
  //   );
  // }
  //
  // Widget PaneRight() {
  //   return Container(
  //     color: Colors.red,
  //   );
  // }
}
