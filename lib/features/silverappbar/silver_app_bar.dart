import 'package:flutter/material.dart';
import 'package:ginjuice/features/gallery/cocktail_gallery.dart';
import 'package:ginjuice/features/search/search_bar.dart';

class SilverAppBar extends StatefulWidget {
  const SilverAppBar({Key? key}) : super(key: key);

  @override
  State<SilverAppBar> createState() => _SilverAppBarState();
}

class _SilverAppBarState extends State<SilverAppBar> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.only(bottom: 10),
          sliver: SliverAppBar(
            pinned: true,
            snap: false,
            floating: false,
            expandedHeight: 230.0,
            elevation: 5,
            titleSpacing: 0,
            backgroundColor: const Color(0xFF006874),
            collapsedHeight: 100.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                child: Text('Choose a drink',
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge
                        ?.apply(color: Colors.white70)),
              ),
            ),
            bottom: const PreferredSize(
                preferredSize: Size.fromHeight(0),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: SearchBar(),
                )),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(10.0),
          sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) => CocktailGallery(),
                childCount: 10,
              )),
        ),
      ],
    );
  }
}
