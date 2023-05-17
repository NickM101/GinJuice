import 'package:flutter/material.dart';
import 'package:open_mail_app/open_mail_app.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/widgets/custom_elevated_button.dart';

class SentMagicLink extends StatelessWidget {
  const SentMagicLink({super.key});

  void openDefaultMail() async {
    await OpenMailApp.openMailApp(
      nativePickerTitle: 'Select email app to open',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              const Image(
                image: AssetImage('assets/images/email.png'),
              ),
              SizedBox(
                height: 4.h,
              ),
              Text(
                'Magic Link Sent',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              SizedBox(
                height: 4.h,
              ),
              Text(
                'Thank you for choosing our mobile app! We\'ve just sent you a magic link to securely confirm your access and unlock exciting features. Simply tap the link to validate your account and start exploring our app\'s amazing functionalities. Get ready to experience convenience at your fingertips!',
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 4.h,
              ),
              CustomElevatedButton(
                  text: 'Open Mail App', onPressed: openDefaultMail)
            ],
          ),
        ),
      ),
    );
  }
}
