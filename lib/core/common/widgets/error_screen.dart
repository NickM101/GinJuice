import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

import 'custom_elevated_button.dart';

class ErrorScreen extends StatelessWidget {
  final VoidCallback onPress;
  final String title, description, label;

  const ErrorScreen({
    Key? key,
    required this.onPress,
    required this.label,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          const Spacer(),
          Lottie.asset('assets/json/turbine_empty.json', height: 40.h),
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          SizedBox(
            height: 1.h,
          ),
          Text(
            description,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 2.h,
          ),
          CustomElevatedButton(
            onPressed: onPress,
            text: label,
          ),
          const Spacer()
        ],
      ),
    );
  }
}
