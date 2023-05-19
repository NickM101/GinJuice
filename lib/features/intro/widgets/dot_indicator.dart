import 'package:flutter/material.dart';

class DotIndicator extends StatelessWidget {
  final bool isActive;
  final Color color;
  const DotIndicator({
    Key? key,
    required this.color,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: isActive ? 20 : 10,
      width: isActive ? 6 : 3,
      decoration: BoxDecoration(
          color: isActive ? color : color.withOpacity(0.4),
          borderRadius: const BorderRadius.all(Radius.circular(12))),
    );
  }
}
