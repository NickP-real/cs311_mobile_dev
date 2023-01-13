import 'package:flutter/material.dart';

import 'pokemon_api.dart';

class PokemonDetail extends StatelessWidget {
  const PokemonDetail({super.key, required this.pokemonId});

  final int pokemonId;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchPokemonInfo(pokemonId),
      builder: (context, AsyncSnapshot<PokemonInfo> snapshot) {
        if (snapshot.hasData) {
          return Detail(pokemon: snapshot.data!, id: pokemonId);
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

class Detail extends StatelessWidget {
  const Detail({super.key, required this.pokemon, required this.id});

  final PokemonInfo pokemon;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(pokemon.name), centerTitle: true),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.network(genPokemonImageUrl(id)),
        Text("Name: ${pokemon.name}"),
        Text("Types: ${pokemon.types}"),
        Text("Ability: ${pokemon.ability}"),
      ]),
    );
  }
}
