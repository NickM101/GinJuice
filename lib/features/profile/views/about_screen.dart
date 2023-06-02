import 'package:flutter/material.dart';
import 'package:ginjuice/core/common/widgets/custom_elevated_button.dart';
import 'package:ginjuice/core/routes/route_utils.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

import '../../../core/common/widgets/text_logo_widget.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text('About'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Image.asset(
                'assets/images/logo.webp',
                height: 20.h,
              ),
              SizedBox(
                height: 1.h,
              ),
              const TextLogoWidget(),
              SizedBox(
                height: 1.h,
              ),
              Text(
                'Welcome to GinJuice: The Ultimate Cocktail Experience.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                'Elevate your mixology game with Gin Juice. Discover a world of exquisite gin-based cocktails crafted to perfection. From classic gin and tonics to innovative creations, our extensive library of recipes offers something for every taste. Our user-friendly interface makes cocktail creation a breeze, allowing you to explore, mix, and master the art of mixology. Whether you\'re a seasoned bartender or a home enthusiast, Gin Juice is your go-to app for inspiration, guidance, and unforgettable cocktail experiences. Cheers to a world of gin-infused delight!',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                'Have questions or feedback? Reach out to us at info@ginjuice.com or fill out the form below.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const Spacer(),
              CustomElevatedButton(
                onPressed: () {
                  context.goNamed(AppScreen.explore.routeName);
                },
                text: 'Explore GinJuice',
              )
            ],
          )),
    );
  }
}
