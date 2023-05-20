import 'package:flutter/material.dart';
import 'package:ginjuice/core/common/widgets/custom_elevated_button.dart';
import 'package:sizer/sizer.dart';

import '../widgets/avatar_widget.dart';

class UpdateProfile extends StatelessWidget {
  UpdateProfile({super.key});

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  void _updateImage() {
    print('Updating image');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 2.h,
              ),
              AvatarWidget(
                image:
                    'https://em-content.zobj.net/thumbs/120/apple/354/smiling-face-with-sunglasses_1f60e.png',
                icon: Icons.camera_enhance,
                onPress: _updateImage,
              ),
              SizedBox(
                height: 2.h,
              ),
              TextField(
                controller: _userNameController,
                decoration: const InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              TextField(
                controller: _phoneController,
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              CustomElevatedButton(text: 'Update Account', onPressed: () {})
            ],
          ),
        ),
      ),
    );
  }
}
