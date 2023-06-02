import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

import '../../../core/common/widgets/custom_elevated_button.dart';
import '../../../core/routes/route_utils.dart';

class EmailMagicLink extends StatelessWidget {
  EmailMagicLink({super.key});
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Image(
        height: 60.h,
        width: double.infinity,
        image: const AssetImage('assets/images/bar.webp'),
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
                CustomElevatedButton(
                    text: 'Get Magic Link',
                    onPressed: () {
                      context.pushNamed(AppScreen.checkEmail.routeName);
                    }),
                const Text('Hold the button to simulate login')
              ],
            ),
          );
        },
      ),
    );
  }
}
