import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ginjuice/core/common/controllers/theme_provider.dart';
import 'package:ginjuice/features/profile/controller/profile_controller.dart';
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
                      Text(
                        'johndoe@gmail.com',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      FilledButton(
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all<Size>(
                            Size(60.w, 5.h),
                          ),
                        ),
                        onPressed: () {
                          context.pushNamed(AppScreen.updateAccount.routeName);
                        },
                        child: const Text('Edit Avatar'),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Consumer(
              builder: (context, ref, child) {
                final themeMode = ref.watch(themesProvider);

                return ListTile(
                  leading: const Icon(Icons.color_lens_rounded),
                  title: const Text('Theme Mode'),
                  subtitle: Text(getThemeModeText(themeMode)),
                  trailing: Switch(
                      value: themeMode != ThemeMode.light,
                      onChanged: (value) {
                        if (value) {
                          ref
                              .read(themesProvider.notifier)
                              .setThemeMode(ThemeMode.dark);
                        } else {
                          ref
                              .read(themesProvider.notifier)
                              .setThemeMode(ThemeMode.light);
                        }
                      }),
                );
              },
            ),
            Consumer(
              builder: (context, ref, child) {
                final notification = ref.watch(profileNotificationProvider);
                return ListTile(
                  leading: const Icon(Icons.notifications_active),
                  title: const Text('Notifications'),
                  trailing: Switch(
                    value: notification,
                    onChanged: (value) => ref
                        .read(profileNotificationProvider.notifier)
                        .update((state) => !state),
                  ),
                );
              },
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

String getThemeModeText(ThemeMode? themeMode) {
  if (themeMode == ThemeMode.system) {
    return 'System Mode ';
  } else if (themeMode == ThemeMode.light) {
    return 'Light Mode';
  } else if (themeMode == ThemeMode.dark) {
    return 'Dark Mode';
  } else {
    return '';
  }
}
