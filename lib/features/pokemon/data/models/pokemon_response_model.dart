
class PokemonResponseModel {
  const PokemonResponseModel({
    required this.name,
    required this.urlImage,
    required this.types,
    required this.order,
  });

  final String name;
  final String urlImage;
  final List<String> types;
  final int order;

  factory PokemonResponseModel.fromJson(Map<String, dynamic> json) =>
      PokemonResponseModel(
        name: json["name"],
        urlImage: json["sprites"]["other"]["home"]["front_default"],
        types: List<String>.from(
          json["types"]?.map((x) => x["type"]["name"]) ?? [],
        ),
        order: json["order"],
      );
}
