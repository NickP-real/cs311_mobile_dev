import 'package:cs311hw06/pokemon_theme.dart';

import 'pokemon_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'count.dart';

class PokemonCounter extends StatefulWidget {
  const PokemonCounter({Key? key}) : super(key: key);

  @override
  State<PokemonCounter> createState() => _PokemonCounterState();
}

class _PokemonCounterState extends State<PokemonCounter> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<PokemonService, PokemonTheme>(
      builder: (_, pokemonService, pokemonTheme, __) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Pokemon Count'),
            backgroundColor: pokemonTheme.currentTheme,
          ),
          body: const Center(
            child: Count(),
          ),
        );
      },
    );
  }
}
