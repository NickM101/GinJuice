import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class OnboardContent extends StatelessWidget {
  final Image image;
  final String title, description;

  const OnboardContent({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        image,
        SizedBox(
          height: 5.h,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 2.h,
        ),
        Text(
          description,
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
