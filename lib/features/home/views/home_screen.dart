import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';
import 'package:ginjuice/features/home/widgets/header_widget.dart';

import '../controllers/home_controller.dart';
import '../widgets/random_cocktail.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with SingleTickerProviderStateMixin {
  late final TabController controller = TabController(length: 26, vsync: this);

  @override
  Widget build(BuildContext context) {
    final popularDrinksAsyncValue = ref.watch(popularDrinksProvider);

    return Column(
      children: [
        const HeaderWidget(),
        SizedBox(
          height: 1.h,
        ),
        const RandomCocktail(),
      ],
    );
  }
}
