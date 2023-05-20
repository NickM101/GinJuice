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
      height: 20.h,
      child: Stack(
        children: [
          CircleAvatar(
            radius: 60,
            backgroundColor: Colors.transparent,
            backgroundImage: NetworkImage(image),
          ),
          Positioned(
            bottom: 20,
            left: 40,
            child: GestureDetector(
              onTap: onPress,
              child: Container(
                  height: 5.h,
                  width: 5.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.black,
                      border: Border.all(color: Colors.white)),
                  child: const Icon(
                    Icons.edit,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
