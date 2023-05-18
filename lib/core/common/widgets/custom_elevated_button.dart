import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isLoading;
  final bool isDisabled;

  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: SizedBox(
        width: double.infinity,
        height: 7.h,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          child: ElevatedButton(
            onPressed: isDisabled || isLoading ? null : onPressed,
            style: ElevatedButton.styleFrom(
                shape: const BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)))),
            child: buildButtonChild(theme),
          ),
        ),
      ),
    );
  }

  Widget buildButtonChild(ThemeData theme) {
    if (isLoading) {
      return const SizedBox(
        height: 20.0,
        width: 20.0,
        child: CircularProgressIndicator(
          valueColor:
              AlwaysStoppedAnimation<Color>(Color.fromARGB(255, 241, 101, 101)),
          strokeWidth: 2.0,
        ),
      );
    }

    return Text(
      text,
      style: theme.textTheme.titleMedium,
    );
  }
}
