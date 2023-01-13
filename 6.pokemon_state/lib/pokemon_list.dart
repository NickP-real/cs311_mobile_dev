import 'package:cs311hw06/pokemon_theme.dart';

import 'pokemon_api.dart';
import 'pokemon_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({super.key});

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  int _currSelect = 0;

  void _onPokemonClick(int index, PokemonTheme pokemonTheme) async {
    pokemonTheme.setTheme(index);
    setState(() {
      _currSelect = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<PokemonService, PokemonTheme>(
        builder: (_, pokemonService, pokemonTheme, __) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Pokemon List'),
          backgroundColor: pokemonTheme.currentTheme,
        ),
        body: GridView.builder(
          itemCount: pokemonService.pokemonCount,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
                onTap: () => _onPokemonClick(index, pokemonTheme),
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        border: Border.all(
                            width: 5,
                            color: _currSelect == index
                                ? Colors.black
                                : Colors.white)),
                    child: Image.network(genPokemonImageUrl(index + 1))));
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
        ),
      );
    });
  }
}
