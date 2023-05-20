import 'package:flutter/material.dart';
import 'package:ginjuice/features/details/widgets/cover_image.dart';
import 'package:sizer/sizer.dart';

class CocktailDetail extends StatelessWidget {
  const CocktailDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CoverImageWithText(),
          SizedBox(
            height: 2.h,
          ),
        ],
      ),
    );
  }
}
