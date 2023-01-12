import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pokemon_app/features/pokemon/data/datasources/remote/moves_datasource.dart';
import 'package:pokemon_app/features/pokemon/data/models/moves_response_model.dart';
import 'package:pokemon_app/shared/data/http.service.dart';

class MovesDataSourceImp implements MovesDataSource {
  final String _pokemonUrl = dotenv.get('POKEMON_API');

  @override
  Future<MovesModel> getOne(String name) async {
    try {
      final response = await DioClient(_pokemonUrl).getOne('/move/$name');
      return MovesModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<MovesModel> getOneByID(int id) async {
    try {
      final response = await DioClient(_pokemonUrl).getOne('/move/$id');
      return MovesModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<String>> listAll(int offset) async {
    try {
      final response =
          await DioClient(_pokemonUrl).getMany('/move?limit=20&offset=$offset');
      return List.from(response.map((e) => e['name']));
    } catch (e) {
      rethrow;
    }
  }
}
