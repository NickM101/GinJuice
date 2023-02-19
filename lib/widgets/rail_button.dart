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
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Icon(icon, color: Colors.white),
              const SizedBox(width: 8.0),
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
      ..moveTo(0, -50)
      ..lineTo(0, 80)
      ..lineTo(size.width * 0.8, 50)
      ..lineTo(size.width * 0.8, -20)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
