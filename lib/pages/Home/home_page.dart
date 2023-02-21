import 'package:flutter/material.dart';
import 'package:ginjuice/pages/Home/widgets/cocktail_gallery.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int paneProportion = 100;

  final List<String> items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 6',
    'Item 7',
    'Item 8',
    'Item 9',
    'Item 10',
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 6',
    'Item 7',
    'Item 8',
    'Item 9',
    'Item 10',
  ];

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
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              return const ListTile(title: CocktailGallery());
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
