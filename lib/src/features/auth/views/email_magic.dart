import 'package:flutter/material.dart';
import 'package:ginjuice/core/widgets/custom_elevated_button.dart';
import 'package:sizer/sizer.dart';

class EmailMagicLink extends StatelessWidget {
  EmailMagicLink({super.key});
  final TextEditingController _emailController = TextEditingController();

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email';
    } else if (!value.contains('@')) {
      return 'Invalid email address';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image(
        height: 60.h,
        image: const AssetImage('assets/images/bar.png'),
        fit: BoxFit.cover,
      ),
      bottomSheet: BottomSheet(
        onClosing: () {},
        builder: (context) {
          return Container(
            padding: const EdgeInsets.all(16.0),
            width: double.infinity,
            height: 50.h,
            alignment: Alignment.center,
            child: Column(
              children: [
                SizedBox(
                  height: 3.h,
                ),
                Text(
                  'GinJuice',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                SizedBox(
                  height: 1.h,
                ),
                const Text('Enter your email address to get a magic link'),
                SizedBox(
                  height: 5.h,
                ),
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email Address',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                CustomElevatedButton(text: 'Get Magic Link', onPressed: () {})
              ],
            ),
          );
        },
      ),
    );
  }
}
