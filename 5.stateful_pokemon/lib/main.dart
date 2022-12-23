import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp(
      items: List<String>.generate(
          150,
          (i) =>
              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/${i + 1}.png'), // generate a list of 150 Pokemon
    ),
  );
}

class MyApp extends StatefulWidget {
  final List<String> items;

  const MyApp({super.key, required this.items});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<bool> favorites = List<bool>.generate(150, (_) => false);

  void toggleFavorite(int index) {
    setState(() {
      favorites[index] = !favorites[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    final favoritesCounts =
        favorites.where((element) => element).toList().length;
    final title =
        'Pokemon List ${favoritesCounts == 0 ? "" : "($favoritesCounts)"}';
    final pokemons = List.generate(widget.items.length,
        (i) => Pokemon(src: widget.items[i], isFavorite: favorites[i]));

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(title: Text(title), centerTitle: true),
        body: ListView.builder(
          itemCount: widget.items.length ~/
              3, // 3 items per row so we divide the number of items by 3
          itemBuilder: (context, index) {
            return Row(
              children: [
                for (int i = 0; i < 3; i++)
                  Expanded(
                      child: PokemonCard(
                          pokemon: pokemons[index * 3 + i],
                          onPressed: () => toggleFavorite(index * 3 + i)))
              ],
            );
          },
        ),
      ),
    );
  }
}

class Pokemon {
  final String src;
  final bool isFavorite;

  Pokemon({required this.src, required this.isFavorite});
}

class PokemonCard extends StatelessWidget {
  const PokemonCard(
      {super.key, required this.pokemon, required this.onPressed});

  final Pokemon pokemon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      // Stack is for overlaying Favorite icon on top of image
      children: [
        Image.network(pokemon.src),
        IconButton(
            padding: EdgeInsets.zero,
            iconSize: 50,
            icon: Icon(
                pokemon.isFavorite ? Icons.favorite : Icons.favorite_border),
            color: pokemon.isFavorite ? Colors.red : Colors.black,
            onPressed: onPressed),
      ],
    );
  }
}
