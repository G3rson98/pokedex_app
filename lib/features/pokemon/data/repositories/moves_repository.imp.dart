import 'package:pokemon_app/features/pokemon/data/datasources/remote/moves_datasource.dart';
import 'package:pokemon_app/features/pokemon/domain/entities/moves_response.entity.dart';
import 'package:pokemon_app/features/pokemon/domain/repositories/moves_repository.dart';
import 'package:pokemon_app/shared/utils/enum_color_type.enum.dart';

class MovesRepositoryImp implements MovesRepository {
  final MovesDataSource remoteDataSource;

  const MovesRepositoryImp({
    required this.remoteDataSource,
  });

  @override
  Future<Moves> getOne(String name) async {
    final response = await remoteDataSource.getOne(name);
    // ignore: prefer_const_constructors
    return Moves(
        accuaracy: response.accuaracy,
        category: response.category,
        critRatio: response.critRatio,
        entrie: response.entrie,
        potency: response.potency,
        pp: response.pp,
        priority: response.priority,
        type: response.type,
        color: ColorTypePokemon.fromJson(response.type));
  }

  @override
  Future<List<Moves>> listAll(int offset) async {
    final response = await remoteDataSource.listAll(offset);
    final moves = await Future.wait(List.generate(
      20,
      (index) => remoteDataSource.getOne(response[index]),
    ));
    return List.from(
      moves.map(
        // ignore: prefer_const_constructors
        (e) => Moves(
            accuaracy: e.accuaracy,
            category: e.category,
            critRatio: e.critRatio,
            entrie: e.entrie,
            potency: e.potency,
            pp: e.pp,
            priority: e.priority,
            type: e.type,
            color: ColorTypePokemon.fromJson(e.type)),
      ),
    );
  }
}
