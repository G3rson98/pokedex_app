import 'package:pokemon_app/features/pokemon/data/models/stat_response_model.dart';

class PokemonResponseModel {
  const PokemonResponseModel({
    required this.name,
    required this.urlImage,
    required this.types,
    required this.order,
    required this.stats,
  });

  final String name;
  final String urlImage;
  final List<String> types;
  final int order;
  final List<StatsModel> stats;

  factory PokemonResponseModel.fromJson(Map<String, dynamic> json) =>
      PokemonResponseModel(
        name: json["name"],
        urlImage: json["sprites"]["other"]["home"]["front_default"],
        types: List<String>.from(
          json["types"]?.map((x) => x["type"]["name"]) ?? [],
        ),
        order: json["order"],
        stats: List<StatsModel>.from(
          json["stats"]?.map(
            (x) => StatsModel.fromJson(x),
          ),
        ),
      );
}
