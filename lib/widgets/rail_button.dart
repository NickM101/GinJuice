import 'package:flutter/material.dart';

class RailButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;

  RailButton({required this.text, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: CustomPaint(
        painter: _RailButtonPainter(),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.white),
              Text(
                text,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RailButtonPainter extends CustomPainter {
  var selected_index = 1;
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = selected_index == 1 ? Colors.purple : Colors.black
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..strokeMiterLimit = 6.0;

    final path = Path()
      ..moveTo(0, -50)
      ..lineTo(0, 85)
      ..lineTo(size.width * 0.9, 55)
      ..lineTo(size.width * 0.9, -20)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
