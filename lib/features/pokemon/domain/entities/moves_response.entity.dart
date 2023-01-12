import 'package:pokemon_app/shared/utils/enum_color_type.enum.dart';

class Moves {
  const Moves(
      {required this.type,
      required this.potency,
      required this.pp,
      required this.priority,
      required this.category,
      required this.accuaracy,
      required this.critRatio,
      required this.entrie,
      required this.color});

  final String type;
  final int potency;
  final int pp;
  final int priority;
  final String category;
  final String accuaracy;
  final double critRatio;
  final String entrie;
  final ColorTypePokemon color;
}
