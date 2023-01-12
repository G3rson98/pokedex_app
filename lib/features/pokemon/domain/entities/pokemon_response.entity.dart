import 'package:pokemon_app/features/pokemon/domain/entities/stats_response.entity.dart';
import 'package:pokemon_app/shared/utils/enum_color_type.enum.dart';

class PokemonResponse {
  const PokemonResponse({
    required this.name,
    required this.urlImage,
    required this.types,
    required this.color,
    required this.id,
    required this.stats,
  });

  final String name;
  final String urlImage;
  final List<String> types;
  final ColorTypePokemon color;
  final int id;
  final List<Stats> stats;
}
