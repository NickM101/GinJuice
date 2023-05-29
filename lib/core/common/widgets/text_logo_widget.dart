import 'package:flutter/material.dart';

class TextLogoWidget extends StatelessWidget {
  const TextLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final TextStyle? typography = Theme.of(context).textTheme.titleLarge;
    return Center(
      child: RichText(
        text: TextSpan(
          text: 'Gin',
          style: typography,
          children: [
            TextSpan(
              text: 'Juice',
              style: typography?.apply(color: const Color(0xfff0576b)),
            ),
          ],
        ),
      ),
    );
  }
}
