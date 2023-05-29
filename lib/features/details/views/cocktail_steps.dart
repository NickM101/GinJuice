import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/common/models/cocktail_model.dart';

class CocktailSteps extends StatelessWidget {
  final CocktailModel item;

  const CocktailSteps({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String instructions = item.strInstructions ?? '';
    List<String> instructionList = instructions.split('. ');

    instructionList.removeWhere((instruction) => instruction.isEmpty);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20.h,
              width: 90.w,
              child: Center(
                child: Text(
                  'Instructions'.toUpperCase(),
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Card(
              elevation: 5,
              child: Center(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: instructionList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        child: Text('${index + 1}'),
                      ),
                      title: Text(instructionList[index]),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
