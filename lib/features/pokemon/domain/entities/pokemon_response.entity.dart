import 'package:pokemon_app/shared/utils/enum_color_type.enum.dart';

class PokemonResponse {
  const PokemonResponse({
    required this.name,
    required this.urlImage,
    required this.types,
    required this.color,
    required this.order,
  });

  final String name;
  final String urlImage;
  final List<String> types;
  final ColorTypePokemon color;
  final int order;
}
