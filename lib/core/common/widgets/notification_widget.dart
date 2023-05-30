import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

import 'custom_elevated_button.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text("Notifications"),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_off_rounded),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              const Spacer(),
              Lottie.asset('assets/json/cocktail_drink.json', height: 40.h),
              Text(
                'Uh-oh! Nothing to toast to at the moment!',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              SizedBox(
                height: 1.h,
              ),
              const Text(
                "Looks like you're all caught up! No new notifications for now. Time to sit back, relax, and enjoy the view!",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 2.h,
              ),
              CustomElevatedButton(
                onPressed: () {},
                text: 'Check Again',
              ),
              const Spacer()
            ],
          ),
        ));
  }
}
