import 'package:flutter/material.dart';
import 'package:pokemon_api/pokemon_api.dart';
import 'package:pokemon_api/pokemon_detail.dart';

class PokemonList extends StatelessWidget {
  const PokemonList({super.key});

  @override
  Widget build(BuildContext context) {
    void onPokemonTap(int id) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PokemonDetail(pokemonId: id),
          ));
    }

    return Scaffold(
        appBar: AppBar(title: Text("Pokemon List")),
        body: Row(
          children: [
            Expanded(
                child: GestureDetector(
                    onTap: () => onPokemonTap(1),
                    child: Image.network(genPokemonImageUrl(1)))),
            Expanded(
                child: GestureDetector(
                    onTap: () => onPokemonTap(2),
                    child: Image.network(genPokemonImageUrl(2)))),
            Expanded(
                child: GestureDetector(
                    onTap: () => onPokemonTap(3),
                    child: Image.network(genPokemonImageUrl(3)))),
          ],
        ));
  }
}
