import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ginjuice/core/routes/route_utils.dart';
import 'package:ginjuice/src/features/intro/controller/indicator_controller.dart';
import 'package:ginjuice/src/features/intro/models/onboard_model.dart';
import 'package:ginjuice/src/features/intro/widgets/dot_indicator.dart';
import 'package:ginjuice/src/features/intro/widgets/onboarding_content.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: [
              const Spacer(),
              TextButton(
                  onPressed: () {
                    context.pushNamed(AppScreen.login.routeName);
                  },
                  child: const Text('Skip'))
            ],
          ),
          Expanded(
            flex: 4,
            child: PageView.builder(
              controller: _pageController,
              itemCount: onboardData.length,
              onPageChanged: (value) =>
                  ref.read(indicatorProvider.notifier).update((state) => value),
              itemBuilder: (context, index) => OnboardContent(
                image: onboardData[index].image,
                title: onboardData[index].title,
                description: onboardData[index].description,
              ),
            ),
          ),
          Row(
            children: [
              ...List.generate(
                  onboardData.length,
                  (index) => Padding(
                        padding: const EdgeInsets.only(right: 4.0),
                        child: DotIndicator(
                          isActive: index == ref.watch(indicatorProvider),
                        ),
                      )),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease);
                },
                style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    minimumSize: const Size(60, 60)),
                child: const Icon(Icons.arrow_forward),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
