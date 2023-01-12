import '../entities/moves_response.entity.dart';

abstract class MovesRepository {
  Future<Moves> getOne(String name);
  Future<List<Moves>> listAll(int offset);
}
