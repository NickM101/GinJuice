import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.amber,
        width: 300,
        height: 300,
        child: CustomPaint(
          painter: LearningPainting(),
          // child: Stack(
          //   children: const [
          //     Positioned(
          //       top: 32,
          //       left: 12,
          //       child: Icon(Icons.accessibility_rounded),
          //     ),
          //     Positioned(
          //       top: 60,
          //       left: 12,
          //       child: Text(
          //         'Da Vinci',
          //         style: TextStyle(
          //           color: Colors.white,
          //           fontSize: 16,
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
        ),
      ),
    );
  }
}

class LearningPainting extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = 5
      ..color = Colors.black
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..strokeMiterLimit = 60;

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(0, size.height)
      ..lineTo(size.width * 0.2, size.height * 0.8)
      ..lineTo(size.width * 0.2, size.height * 0.2)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(LearningPainting oldDelegate) => false;
}
