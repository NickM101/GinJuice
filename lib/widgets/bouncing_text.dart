import 'package:flutter/material.dart';

class BouncingText extends StatefulWidget {
  final String text;

  const BouncingText(this.text, {super.key});

  @override
  _BouncingTextState createState() => _BouncingTextState();
}

class _BouncingTextState extends State<BouncingText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..repeat(reverse: true);
    _animation = TweenSequence(
      [
        TweenSequenceItem(tween: Tween(begin: 0.0, end: 10.0), weight: 1),
        TweenSequenceItem(tween: Tween(begin: 10.0, end: 0.0), weight: 1),
      ],
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          WidgetSpan(
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0.0, _animation.value),
                  child: Text(
                    widget.text.substring(0, 3),
                    style: const TextStyle(
                        color: Color(0xFFED6D6D),
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                );
              },
            ),
          ),
          TextSpan(
            text: widget.text.substring(3),
            style: const TextStyle(
                color: Colors.white70,
                fontSize: 40,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
