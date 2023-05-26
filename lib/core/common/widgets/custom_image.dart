import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CustomImage extends StatelessWidget {
  final String src;
  final String id;

  const CustomImage({
    Key? key,
    required this.src,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeMode = Theme.of(context).brightness == Brightness.light;
    return CachedNetworkImage(
        imageUrl: src,
        height: 20.h,
        width: 35.w,
        fit: BoxFit.cover,
        key: ValueKey(id),
        progressIndicatorBuilder: (context, url, progress) {
          return Container(
            decoration: BoxDecoration(
              color:
                  themeMode ? const Color(0xd9d9d9) : const Color(0x00000000),
              image: DecorationImage(
                  image: themeMode
                      ? const AssetImage('assets/images/light_placeholder.png')
                      : const AssetImage('assets/images/dark_placeholder.png'),
                  fit: BoxFit.cover),
            ),
            child: const Align(
              alignment: Alignment.bottomCenter,
              child: Text('Loading...'),
            ),
          );
        },
        errorWidget: (context, url, error) {
          final statusCode = (error as dynamic).statusCode;

          return Container(
            decoration: BoxDecoration(
              color:
                  themeMode ? const Color(0x00000000) : const Color(0xd9d9d9),
              image: DecorationImage(
                  image: themeMode
                      ? const AssetImage('assets/images/dark_placeholder.png')
                      : const AssetImage('assets/images/light_placeholder.png'),
                  fit: BoxFit.cover),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: Text(
                  statusCode.toString(),
                  style: Theme.of(context).textTheme.bodyLarge?.apply(
                        color: themeMode ? Colors.grey.shade600 : Colors.black,
                        fontWeightDelta: 800,
                      ),
                ),
              ),
            ),
          );
        });
  }
}
