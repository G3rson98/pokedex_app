import 'package:pokemon_app/features/pokemon/data/models/pokemon_response_model.dart';

abstract class PokemonDataSource {
  Future<PokemonResponseModel> getOne(String name);
  Future<List<String>> listAll(int offset);
}
