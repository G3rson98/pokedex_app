import 'package:pokemon_app/features/pokemon/domain/entities/moves_response.entity.dart';
import 'package:pokemon_app/features/pokemon/domain/repositories/moves_repository.dart';

class ListMovesUseCase {
  final MovesRepository repository;
  const ListMovesUseCase({required this.repository});

  Future<List<Moves>> call({required int offset}) async {
    return await repository.listAll(offset);
  }
}
