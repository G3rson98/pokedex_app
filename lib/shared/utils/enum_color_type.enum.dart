import 'package:flutter/material.dart';

enum ColorTypePokemon {
  normal(Color(0xFFA8A77A), 'normal'),
  fire(Color(0xFFEE8130), 'fire'),
  water(Color(0xFF6390F0), 'water'),
  electric(Color(0xFFF7D02C), 'electric'),
  grass(Color(0xFF7AC74C), 'grass'),
  ice(Color(0xFF96D9D6), 'ice'),
  fighting(Color(0xFFC22E28), 'fighting'),
  poison(Color(0xFFA33EA1), 'poison'),
  ground(Color(0xFFE2BF65), 'ground'),
  flying(Color(0xFFA98FF3), 'flying'),
  psychic(Color(0xFFF95587), 'psychic'),
  bug(Color(0xFFA6B91A), 'bug'),
  rock(Color(0xFFB6A136), 'rock'),
  ghost(Color(0xFF735797), 'ghost'),
  dragon(Color(0xFF6F35FC), 'dragon'),
  dark(Color(0xFF705746), 'dark'),
  steel(Color(0xFFB7B7CE), 'steel'),
  fairy(Color(0xFFD685AD), 'fairy');

  final Color color;
  final String type;

  const ColorTypePokemon(
    this.color,
    this.type,
  );

  factory ColorTypePokemon.fromJson(String type) {
    return values.firstWhere(
      (e) => e.type == type,
      orElse: () => ColorTypePokemon.normal,
    );
  }
}
