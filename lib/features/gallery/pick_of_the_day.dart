import 'package:flutter/material.dart';

class PickOfTheDay extends StatelessWidget {
  const PickOfTheDay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Card(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const <Widget>[
                              Text(
                                'Salted Toffee Martin Martin Martin',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(bottom: 2.0)),
                              Text(
                                'Alcoholic',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: const <Widget>[
                              Text(
                                'Cocktail',
                                style: TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.black87,
                                ),
                              ),
                              // Text(
                              //   '$publishDate - $readDuration',
                              //   style: const TextStyle(
                              //     fontSize: 12.0,
                              //     color: Colors.black54,
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
            AspectRatio(
              aspectRatio: 1.0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  "https://www.thecocktaildb.com/images/media/drink/tqyrpw1439905311.jpg",
                ),
              ),
            ),
          ],
        ),
      ),
    );

    // );
  }
}
