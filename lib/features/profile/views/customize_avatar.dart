import 'package:flutter/material.dart';
import 'package:fluttermoji/fluttermoji.dart';
import 'package:fluttermoji/fluttermojiCircleAvatar.dart';
import 'package:sizer/sizer.dart';

class CustomizeAvatar extends StatelessWidget {
  const CustomizeAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text('Customize'),
        actions: [
          FluttermojiSaveWidget(
            radius: 20,
            theme: FluttermojiThemeData(
              iconColor: Theme.of(context).primaryColor,
              tileMargin: const EdgeInsets.symmetric(horizontal: 3.0),
              tilePadding: const EdgeInsets.symmetric(horizontal: 3.0),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: FluttermojiCircleAvatar(
              radius: 70,
            ),
          ),
          SizedBox(
            width: 2.w,
          ),
          const Spacer(),
          FluttermojiCustomizer(
            scaffoldWidth: 100.w,
            scaffoldHeight: 55.h,
            autosave: false,
            theme: FluttermojiThemeData(
              primaryBgColor: Theme.of(context).scaffoldBackgroundColor,
              secondaryBgColor: Theme.of(context).scaffoldBackgroundColor,
              iconColor: Theme.of(context).primaryColor,
              labelTextStyle: TextStyle(
                color: Theme.of(context).hintColor,
              ),
              boxDecoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
