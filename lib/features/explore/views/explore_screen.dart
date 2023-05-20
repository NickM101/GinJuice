import 'package:flutter/material.dart';
import 'package:ginjuice/features/home/widgets/header_widget.dart';

import '../widgets/cocktail_card.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const HeaderWidget(),
          Expanded(
            flex: 12,
            child: RotatedBox(
              quarterTurns: 3,
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: SingleChildScrollView(
                      reverse: true,
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List<Widget>.generate(
                          26,
                          (int index) {
                            final reversedIndex = 25 - index;
                            final letter = String.fromCharCode(
                                'A'.codeUnitAt(0) + reversedIndex);
                            return Transform.rotate(
                                angle: 90 *
                                    (3.14159265359 /
                                        180), // Rotates the text by 90 degrees clockwise
                                child: GestureDetector(
                                  onTap: () {
                                    print('letter --- $letter');
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 14, vertical: 2),
                                    child: Text(
                                      letter,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                  ),
                                ));
                          },
                        ),
                      ),
                    ),
                  ),
                  const Expanded(
                      flex: 11,
                      child: RotatedBox(
                        quarterTurns: 1,
                        child: CocktailCard(),
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

// Consumer(
//               builder: (context, ref, _) {
//                 final networkImagesAsyncValue =
//                     ref.watch(networkImagesProvider);
//                 return networkImagesAsyncValue.when(
//                   data: (networkImagesList) {
//                     return ListView.builder(
//                       itemCount: networkImagesList.length,
//                       itemBuilder: (context, index) => networkImagesList[index],
//                     );
//                   },
//                   loading: () => CircularProgressIndicator(),
//                   error: (error, stackTrace) => Text('Error: $error'),
//                 );
//               },
//             ),