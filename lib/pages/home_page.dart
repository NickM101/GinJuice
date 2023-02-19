import 'package:flutter/material.dart';
import 'package:ginjuice/widgets/rail_button.dart';

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
    return Scaffold(
      body: Row(
        children: [
          // Left Column
          Container(
            width: 100,
            // color: Colors.blueGrey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RailButton(
                    text: 'Shots',
                    icon: Icons.accessibility_rounded,
                    onPressed: () => {}),
                const SizedBox(
                  height: 50,
                ),
                RailButton(
                    text: 'Shots',
                    icon: Icons.accessibility_rounded,
                    onPressed: () => {}),
                const SizedBox(
                  height: 50,
                ),
                RailButton(
                    text: 'Shots',
                    icon: Icons.accessibility_rounded,
                    onPressed: () => {}),
                // ElevatedButton(
                //   onPressed: () {},
                //   child: Text('Button 1'),
                // ),
                // ElevatedButton(
                //   onPressed: () {},
                //   child: Text('Button 2'),
                // ),
                // ElevatedButton(
                //   onPressed: () {},
                //   child: Text('Button 3'),
                // ),
              ],
            ),
          ),
          // Right Column
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(items[index]),
                );
              },
            ),
          ),
        ],
      ),
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
