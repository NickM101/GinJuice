import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24.h,
      child: Stack(
        children: [
          const CircleAvatar(
            radius: 70,
            backgroundColor: Colors.transparent,
            backgroundImage: NetworkImage(
                'https://em-content.zobj.net/thumbs/120/apple/354/smiling-face-with-sunglasses_1f60e.png'),
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
                onPressed: () {},
                icon: const Icon(Icons.edit),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
