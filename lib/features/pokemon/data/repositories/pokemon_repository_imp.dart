import 'package:pokemon_app/features/pokemon/data/datasources/remote/pokemon_datasoucer.dart';
import 'package:pokemon_app/features/pokemon/domain/entities/pokemon_response.entity.dart';
import 'package:pokemon_app/features/pokemon/domain/entities/stats_response.entity.dart';
import 'package:pokemon_app/features/pokemon/domain/repositories/pokemon_repository.dart';
import 'package:pokemon_app/shared/utils/enum_color_type.enum.dart';

class PokemonRepositoryImp implements PokemonRepository {
  final PokemonDataSource remoteDataSource;

  const PokemonRepositoryImp({
    required this.remoteDataSource,
  });

  @override
  Future<PokemonResponse> getOne(String name) async {
    final response = await remoteDataSource.getOne(name);
    return PokemonResponse(
      name: response.name,
      urlImage: response.urlImage,
      types: response.types,
      color: ColorTypePokemon.fromJson(response.types.first),
      order: response.order,
      stats: List.from(
        response.stats.map(
          (e) => Stats(
            name: e.name,
            baseStat: e.baseStat,
            effort: e.effort,
          ),
        ),
      ),
    );
  }

  @override
  Future<List<PokemonResponse>> listAll(int offset) async {
    final response = await remoteDataSource.listAll(offset);
    final pokemons = await Future.wait(List.generate(
      20,
      (index) => remoteDataSource.getOne(response[index]),
    ));
    return List.from(
      pokemons.map(
        (e) => PokemonResponse(
          name: e.name,
          urlImage: e.urlImage,
          types: e.types,
          color: ColorTypePokemon.fromJson(e.types.first),
          order: e.order,
          stats: List.from(
            e.stats.map(
              (e) => Stats(
                name: e.name,
                baseStat: e.baseStat,
                effort: e.effort,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
