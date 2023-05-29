import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ImageLogoWidget extends StatelessWidget {
  const ImageLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 10,
      height: 10,
      child: Image.asset(
        'assets/images/logo.png',
        width: 10,
        height: 10,
      ),
    );
  }
}
