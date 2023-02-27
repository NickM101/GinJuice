import 'package:flutter/material.dart';
import 'package:ginjuice/models/cocktail.dart';

class CocktailPage extends StatelessWidget {
  final Cocktail cocktail;

  const CocktailPage({Key? key, required this.cocktail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(
          color: Colors.white60,
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(20),
            child: Icon(Icons.favorite_border_rounded, color: Colors.white70),
          )
        ],
      ),
      body: Hero(
        tag: '${cocktail.idDrink}',
        child: Image.network('${cocktail.strDrinkThumb}', fit: BoxFit.cover),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
        height: MediaQuery.of(context).size.height / 1.8,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xFF5B3A6B), Color(0XFF19101E)],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35), topRight: Radius.circular(35))),
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      '${cocktail.strDrink}',
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  const Icon(Icons.share)
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: const [
                  Icon(Icons.favorite_border_rounded),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '203',
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  cocktailRow(
                      title: 'Glass Type', subtitle: '${cocktail.strGlass}'),
                  cocktailRow(
                      title: 'Cocktail Type',
                      subtitle: '${cocktail.strAlcoholic}'),
                  cocktailRow(
                      title: 'Category', subtitle: '${cocktail.strCategory}'),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Ingredients',
                    style: const TextStyle(fontSize: 18),
                  ),
                  Text(
                    '${cocktail.ingredients?.length ?? 0} items',
                    style: const TextStyle(fontSize: 16),
                  )
                ],
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: cocktail.ingredients?.length ?? 0,
                  itemBuilder: (context, index) => Card(
                      color: Colors.transparent,
                      child: ingredientsRow(
                          ingredient: cocktail.ingredients![index])),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget cocktailRow({required String title, required subtitle}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
            width: 100,
            child: Text(
              '${subtitle}',
              textAlign: TextAlign.center,
            ))
      ],
    );
  }

  Widget ingredientsRow({required String ingredient}) {
    return Container(
      height: 50,
      width: 150,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        image: DecorationImage(
            image: NetworkImage(
              'https://www.thecocktaildb.com/images/ingredients/$ingredient-Medium.png',
            ),
            fit: BoxFit.cover),
      ),
    );
  }
}
