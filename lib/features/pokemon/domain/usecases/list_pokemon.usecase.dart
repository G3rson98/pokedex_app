import 'package:pokemon_app/features/pokemon/domain/entities/pokemon_response.entity.dart';
import 'package:pokemon_app/features/pokemon/domain/repositories/pokemon_repository.dart';

class ListPokemonUseCase {
  final PokemonRepository repository;
  const ListPokemonUseCase({required this.repository});

  Future<List<PokemonResponse>> call({required int offset}) async {
    return await repository.listAll(offset);
  }
}
