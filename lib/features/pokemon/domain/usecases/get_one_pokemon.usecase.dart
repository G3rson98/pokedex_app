import 'package:pokemon_app/features/pokemon/domain/repositories/pokemon_repository.dart';

import '../entities/pokemon_response.entity.dart';

class GetOnePokemonUseCase {
  final PokemonRepository repository;
  const GetOnePokemonUseCase({required this.repository});

  Future<PokemonResponse> call(String name) async {
    return await repository.getOne(name);
  }
}
