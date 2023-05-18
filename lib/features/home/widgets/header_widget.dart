import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
          text: TextSpan(
            text: 'Gin',
            style: Theme.of(context).textTheme.titleLarge,
            children: <TextSpan>[
              TextSpan(
                text: 'Juice',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.apply(color: const Color(0xfff0576b)),
              ),
            ],
          ),
        ),
        IconButton(onPressed: () {}, icon: const Icon(Icons.person))
      ],
    );
  }
}
