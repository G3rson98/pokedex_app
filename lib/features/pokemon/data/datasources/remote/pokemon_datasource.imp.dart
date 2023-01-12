import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pokemon_app/features/pokemon/data/datasources/remote/pokemon_datasource.dart';
import 'package:pokemon_app/features/pokemon/data/models/pokemon_response_model.dart';
import 'package:pokemon_app/shared/data/http.service.dart';

class PokemonDataSourceImp implements PokemonDataSource {
  final String _pokemonUrl = dotenv.get('POKEMON_API');

  @override
  Future<PokemonResponseModel> getOne(String name) async {
    try {
      final response = await DioClient(_pokemonUrl).getOne('/pokemon/$name');
      return PokemonResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<String>> listAll(int offset) async {
    try {
      final response = await DioClient(_pokemonUrl)
          .getMany('/pokemon?limit=20&offset=$offset');
      return List.from(response.map((e) => e['name']));
    } catch (e) {
      rethrow;
    }
  }
}
