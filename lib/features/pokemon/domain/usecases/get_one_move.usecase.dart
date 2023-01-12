import 'package:pokemon_app/features/pokemon/domain/repositories/moves_repository.dart';

import '../entities/moves_response.entity.dart';

class GetOneMoveUseCase {
  final MovesRepository repository;
  const GetOneMoveUseCase({required this.repository});

  Future<Moves> call(String name) async {
    return await repository.getOne(name);
  }
}
