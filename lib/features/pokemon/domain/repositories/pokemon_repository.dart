import '../entities/pokemon_response.entity.dart';

abstract class PokemonRepository {
  Future<PokemonResponse> getOne(String name);
  Future<List<PokemonResponse>> listAll(int offset);
}
