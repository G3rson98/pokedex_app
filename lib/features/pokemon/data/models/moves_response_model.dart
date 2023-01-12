class MovesModel {
  const MovesModel(
      {required this.type,
      required this.name,
      required this.potency,
      required this.pp,
      required this.priority,
      required this.category,
      required this.accuaracy,
      required this.critRatio,
      required this.entrie});

  final String type;
  final String name;
  final int potency;
  final int pp;
  final int priority;
  final String category;
  final String accuaracy;
  final double critRatio;
  final String entrie;

  factory MovesModel.fromJson(Map<String, dynamic> json) => MovesModel(
        type: json["type"]["name"],
        name: json["name"],
        potency: json["power"],
        pp: json["pp"],
        priority: json["priority"],
        category: json["damage_class"]["name"],
        accuaracy: json["accuaracy"],
        critRatio: json["meta"]["crit_rate"],
        entrie: json["effect_entries"]["effect"],
      );
}
