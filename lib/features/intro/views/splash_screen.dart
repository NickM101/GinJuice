import 'package:flutter/material.dart';
import 'package:ginjuice/core/routes/route_utils.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeInAnimation;
  late Animation<double> _growAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    // Initialize animation controller
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    // Initialize fade-in animation
    _fadeInAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.0, 0.8, curve: Curves.easeIn),
    ));

    // Initialize slide-up animation
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0.0, 0.2),
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.4, 1.0, curve: Curves.easeOut),
    ));

    _growAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    // Start animation after a delay
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        _animationController.forward();
      }
    }).then((value) => Future.delayed(const Duration(seconds: 3))).then(
        (value) => {context.replaceNamed(AppScreen.onboarding.routeName)});
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SlideTransition(
              position: _slideAnimation,
              child: Image.asset(
                'assets/images/logo.png',
                width: 100,
                height: 100,
              ),
            ),
            const SizedBox(height: 16),
            SlideTransition(
              position: _slideAnimation,
              child: FadeTransition(
                opacity: _fadeInAnimation,
                child: AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return Transform.scale(
                        scale: _growAnimation.value,
                        child: RichText(
                            text: TextSpan(
                                text: 'Gin',
                                style: TextStyle(
                                  fontSize: 24 * _growAnimation.value,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      Theme.of(context).unselectedWidgetColor,
                                ),
                                children: <TextSpan>[
                              TextSpan(
                                text: 'Juice',
                                style: TextStyle(
                                  fontSize: 24 * _growAnimation.value,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xfff0576b),
                                ),
                              ),
                            ])));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
