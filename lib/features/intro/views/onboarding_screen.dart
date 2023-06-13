import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

import '../../../core/routes/route_utils.dart';
import '../controller/indicator_controller.dart';
import '../models/onboard_model.dart';
import '../widgets/dot_indicator.dart';
import '../widgets/onboarding_content.dart';

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
    final indicatorState = ref.watch(indicatorProvider);

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
                    context.goNamed(AppScreen.home.routeName);
                  },
                  child: const Text('Skip'))
            ],
          ),
          SizedBox(
            height: 2.h,
          ),
          Expanded(
            flex: 1,
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
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
            child: Row(
              children: [
                ...List.generate(
                    onboardData.length,
                    (index) => Padding(
                          padding: const EdgeInsets.only(right: 4.0),
                          child: DotIndicator(
                            color: Theme.of(context).primaryColor,
                            isActive: index == indicatorState,
                          ),
                        )),
                const Spacer(),
                Visibility(
                  visible: _isLastPage(indicatorState),
                  child: ArrowButton(
                    onPress: () => {context.goNamed(AppScreen.home.routeName)},
                  ),
                ),
                Visibility(
                  visible: !_isLastPage(indicatorState),
                  child: ArrowButton(
                    onPress: () {
                      _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}

bool _isLastPage(int currentIndex) {
  return currentIndex == onboardData.length - 1;
}

class ArrowButton extends StatelessWidget {
  final VoidCallback onPress;

  const ArrowButton({
    super.key,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
          shape: const CircleBorder(), minimumSize: const Size(60, 60)),
      child: const Icon(Icons.arrow_forward),
    );
  }
}
