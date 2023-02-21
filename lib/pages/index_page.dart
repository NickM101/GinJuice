import 'package:flutter/material.dart';
import 'package:ginjuice/pages/Home/home_page.dart';
import 'package:ginjuice/pages/favorite_page.dart';
import 'package:ginjuice/pages/search_page.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  int selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu_rounded),
          color: Colors.black,
          iconSize: 30.0,
          onPressed: () => {},
        ),
      ),
      body: const [HomePage(), FavoritePage(), SearchPage()][selectedPageIndex],
      bottomNavigationBar: NavigationBar(
        surfaceTintColor: const Color(0xFF24142D),
        shadowColor: const Color(0xFF24142D),
        elevation: 1,

        // onTap it shows the index user selected
        onDestinationSelected: (int index) {
          setState(() {
            selectedPageIndex = index;
          });
        },
        // determines which navigation bar is selected
        selectedIndex: selectedPageIndex,
        // lists all widgets visible on bar
        destinations: const <NavigationDestination>[
          NavigationDestination(
              selectedIcon: Icon(Icons.home),
              icon: Icon(Icons.home_outlined),
              label: 'Home'),
          NavigationDestination(
              selectedIcon: Icon(Icons.favorite),
              icon: Icon(Icons.favorite_border_outlined),
              label: 'Favourite'),
          NavigationDestination(
              selectedIcon: Icon(Icons.search_rounded),
              icon: Icon(Icons.search_outlined),
              label: 'Search'),
        ],
      ),
    );
  }
}
