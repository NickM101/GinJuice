import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class DemoBanner extends StatelessWidget {
  final Widget child;
  final String text;
  final Color backgroundColor;
  final Color textColor;

  const DemoBanner({
    super.key,
    required this.child,
    this.text = 'Demo',
    this.backgroundColor = const Color(0xfff0576b),
    this.textColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Positioned(
          top: 0,
          left: 0,
          child: Container(
            color: backgroundColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                text,
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
