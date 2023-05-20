import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AvatarWidget extends StatelessWidget {
  final String image;
  final IconData icon;
  final VoidCallback onPress;

  const AvatarWidget(
      {super.key,
      required this.image,
      required this.icon,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24.h,
      child: Stack(
        children: [
          CircleAvatar(
            radius: 70,
            backgroundColor: Colors.transparent,
            backgroundImage: NetworkImage(image),
          ),
          Positioned(
            bottom: 25,
            left: 45,
            child: Container(
              height: 6.h,
              width: 6.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.black,
                  border: Border.all(color: Colors.white)),
              child: IconButton(
                onPressed: onPress,
                icon: const Icon(Icons.edit),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
