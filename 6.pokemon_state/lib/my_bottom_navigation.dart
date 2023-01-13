import 'package:cs311hw06/pokemon_counter.dart';
import 'package:cs311hw06/pokemon_list.dart';
import 'package:cs311hw06/pokemon_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyBottomNavigation extends StatefulWidget {
  const MyBottomNavigation({Key? key}) : super(key: key);

  @override
  State<MyBottomNavigation> createState() => _MyBottomNavigationState();
}

class _MyBottomNavigationState extends State<MyBottomNavigation> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Consumer<PokemonTheme>(
      builder: ((_, pokemonTheme, __) {
        return Scaffold(
          body: IndexedStack(
            index: _currentIndex,
            children: const [
              PokemonCounter(),
              PokemonList(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            selectedItemColor: pokemonTheme.currentTheme,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.catching_pokemon), label: 'Pokemon'),
            ],
          ),
        );
      }),
    );
  }
}
