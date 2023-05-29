import 'package:flutter/material.dart';
import 'package:ginjuice/core/common/widgets/text_logo_widget.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 8.0, 0.0, 1.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const TextLogoWidget(),
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications))
        ],
      ),
    );
  }
}
