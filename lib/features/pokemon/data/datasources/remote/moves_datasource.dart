import 'package:pokemon_app/features/pokemon/data/models/moves_response_model.dart';

abstract class MovesDataSource {
  Future<MovesModel> getOne(String name);
  Future<MovesModel> getOneByID(int id);
  Future<List<String>> listAll(int offset);
}
