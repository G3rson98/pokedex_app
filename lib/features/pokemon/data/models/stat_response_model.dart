class StatsModel {
  const StatsModel({
    required this.baseStat,
    required this.effort,
    required this.name,
  });

  final int baseStat;
  final int effort;
  final String name;

  factory StatsModel.fromJson(Map<String, dynamic> json) => StatsModel(
        baseStat: json["base_stat"],
        effort: json["effort"],
        name: json["stat"]["name"],
      );
}
