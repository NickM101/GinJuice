import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import 'package:fluttermoji/fluttermoji.dart';

import '../../../core/routes/route_utils.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void editProfile() {
      print('update');
      context.pushNamed(AppScreen.updateAccount.routeName);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FluttermojiCircleAvatar(
                    radius: 55,
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('johndoe@gmail.com'),
                      FilledButton(
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all<Size>(
                            Size(60.w, 5.h),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text('Edit Profile'),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            ListTile(
              leading: const Icon(Icons.color_lens_rounded),
              title: const Text('Theme Mode'),
              subtitle: const Text('System mode'),
              onTap: () => context.pushNamed(AppScreen.settings.routeName),
              trailing: Switch(
                value: true,
                onChanged: (value) {},
              ),
            ),
            ListTile(
              leading: const Icon(Icons.phone),
              title: const Text('Notifications'),
              trailing: Switch(
                value: true,
                onChanged: (value) {},
              ),
            ),
            ListTile(
              leading: const Icon(Icons.privacy_tip),
              title: const Text('Privacy'),
              onTap: () => context.pushNamed(AppScreen.privacy.pathName),
              trailing: const Icon(Icons.arrow_right),
            ),
            ListTile(
              leading: const Icon(Icons.phone_android),
              title: const Text('About'),
              onTap: () => context.pushNamed(AppScreen.about.pathName),
              trailing: const Icon(Icons.arrow_right),
            ),
            const ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Sign Out'),
            ),
          ],
        ),
      ),
    );
  }
}
