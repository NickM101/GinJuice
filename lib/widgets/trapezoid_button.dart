import 'dart:math';

import 'package:flutter/material.dart';

class TrapezoidButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onPressed;
  final Color color;

  TrapezoidButton(
      {super.key,
      required this.label,
      required this.icon,
      required this.onPressed,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: pi / 2,
      child: Container(
        decoration: ShapeDecoration(
          color: color,
          shape: const BeveledRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0),
              topRight: Radius.circular(25.0),
            ),
          ),
        ),
        height: 60.0,
        width: 120.0,

        child: GestureDetector(
            onTap: () => {},
            child: Transform.rotate(
              angle: pi / -2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [Text('Hello')],
              ),
            )),
        // child: Material(
        //   color: Colors.transparent,
        //   child: InkWell(
        //     onTap: onPressed,
        //     child: Container(
        //       padding: const EdgeInsets.symmetric(vertical: 12.0),
        //       child: Row(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //           Icon(icon, color: Colors.white),
        //           const SizedBox(width: 8.0),
        //           Text(
        //             label,
        //             style: const TextStyle(
        //                 color: Colors.white, fontWeight: FontWeight.bold),
        //           ),
        //         ],
        //       ),
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
