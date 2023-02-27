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
  int _selectedPageIndex = 0;

  final List<Widget> _tabList = const [
    HomePage(),
    FavoritePage(),
    SearchPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.menu_rounded),
            color: Colors.white70,
            iconSize: 30.0,
            onPressed: () => {},
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xFF5B3A6B), Color(0XFF19101E)],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft),
          ),
          child: Stack(
            children: [
              _tabList.elementAt(_selectedPageIndex),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Align(
                  alignment: const Alignment(0.0, 1.0),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(25)),
                    child: Container(
                      width: 300,
                      height: 60,
                      color: Colors.transparent,
                      child: Stack(
                        children: [
                          BottomNavigationBar(
                            selectedItemColor: Colors.yellowAccent,
                            unselectedItemColor: Colors.white70,
                            showSelectedLabels: false,
                            showUnselectedLabels: false,
                            backgroundColor: Colors.black54,
                            currentIndex: _selectedPageIndex,
                            onTap: (int index) {
                              setState(() {
                                _selectedPageIndex = index;
                              });
                            },
                            items: const [
                              BottomNavigationBarItem(
                                  icon: Icon(Icons.home, size: 30),
                                  label: 'Home'),
                              BottomNavigationBarItem(
                                  icon: Icon(Icons.favorite_border_rounded,
                                      size: 30),
                                  label: 'Favorite'),
                              BottomNavigationBarItem(
                                  icon: Icon(Icons.search_rounded, size: 30),
                                  label: 'Search')
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
