import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';

import '../controllers/alphabet_controller.dart';

class AlphabetRow extends ConsumerWidget {
  const AlphabetRow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedLetter = ref.watch(selectedLetterProvider);

    return SingleChildScrollView(
      reverse: true,
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List<Widget>.generate(
          26,
          (int index) {
            final reversedIndex = 25 - index;
            final letter = String.fromCharCode(65 + reversedIndex);
            final isSelected = selectedLetter == letter;
            return Transform.rotate(
              angle: 90 *
                  (3.14159265359 /
                      180), // Rotates the text by 90 degrees clockwise
              child: GestureDetector(
                onTap: () {
                  ref
                      .read(selectedLetterProvider.notifier)
                      .update((state) => letter);
                },
                child: Container(
                  height: 5.h,
                  width: 4.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: isSelected ? Theme.of(context).focusColor : null,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    letter,
                    textAlign: TextAlign.center,
                    style: isSelected
                        ? Theme.of(context).textTheme.titleMedium
                        : Theme.of(context).textTheme.titleSmall,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
