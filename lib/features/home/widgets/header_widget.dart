import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/common/widgets/text_logo_widget.dart';
import '../../../core/routes/route_utils.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: TextLogoWidget(),
        ),
        IconButton(
          onPressed: () => context.pushNamed(AppScreen.notification.routeName),
          icon: const Icon(Icons.notifications),
        )
      ],
    );
  }
}
