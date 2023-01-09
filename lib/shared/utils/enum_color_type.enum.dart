import 'package:flutter/material.dart';

enum ColorTypePokemon {
  grass(Color(0xFF4ad0b1), 'grass'),
  poison(Color(0xFF4ad0b1), 'poison'),
  fire(Color(0xFFfc6c6d), 'fire'),
  water(Color(0xFF77befe), 'water'),
  bug(Color(0xFFa5b42a), 'bug'),
  normal(Color(0xFFb4bac4), 'normal'),
  electric(Color(0xFFffce4b), 'electric'),
  fairy(Color(0xFFe99ead), 'fairy'),
  flying(Color(0xFF4ad0b1), 'flying');

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
