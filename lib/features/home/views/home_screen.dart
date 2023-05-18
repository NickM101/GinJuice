import 'package:flutter/material.dart';
import 'package:ginjuice/core/routes/route_utils.dart';
import 'package:ginjuice/features/home/widgets/cocktail_card.dart';
import 'package:ginjuice/features/home/widgets/header_widget.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late final TabController controller = TabController(length: 26, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [
        const HeaderWidget(),
        Expanded(
          flex: 12,
          child: RotatedBox(
            quarterTurns: 1,
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: TabBar(
                    controller: controller,
                    isScrollable: true,
                    tabs: List<Widget>.generate(26, (int index) {
                      final letter =
                          String.fromCharCode('A'.codeUnitAt(0) + index);
                      return Tab(
                        child: Transform.rotate(
                          angle: -90 *
                              (3.14159265359 /
                                  180), // Rotates the text by 45 degrees counter-clockwise
                          child: Text(letter),
                        ),
                      );
                    }),
                  ),
                ),
                Expanded(
                    flex: 8,
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: TabBarView(
                        controller: controller,
                        children: List<Widget>.generate(26, (int index) {
                          return const CocktailCard();
                        }),
                      ),
                    ))
              ],
            ),
          ),
        )
      ]),
    );
  }
}


// const Color(0xfff0576b)