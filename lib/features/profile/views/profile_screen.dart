import 'package:flutter/material.dart';
import 'package:ginjuice/core/routes/route_utils.dart';
import 'package:ginjuice/features/profile/widgets/avatar_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

import '../../home/widgets/header_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void editProfile() {
      print('update');
      context.pushNamed(AppScreen.updateAccount.routeName);
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const HeaderWidget(),
          SizedBox(
            height: 2.h,
          ),
          AvatarWidget(
            image:
                'https://em-content.zobj.net/thumbs/120/apple/354/smiling-face-with-sunglasses_1f60e.png',
            icon: Icons.edit,
            onPress: editProfile,
          ),
          const Column(
            children: [
              Text('Mohammed Reza'),
              Text('mohammed@gmail.com'),
            ],
          ),
          SizedBox(
            height: 2.h,
          ),
          const ListTile(
            leading: Icon(Icons.phone),
            title: Text('Contact Us'),
          ),
          const ListTile(
            leading: Icon(Icons.feedback_rounded),
            title: Text('Send Feedback'),
          ),
          const ListTile(
            leading: Icon(Icons.privacy_tip),
            title: Text('Privacy Policy'),
          ),
          const ListTile(
            leading: Icon(Icons.document_scanner),
            title: Text('Terms and Conditions'),
          ),
          const ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Log Out'),
          ),
        ],
      ),
    );
  }
}
