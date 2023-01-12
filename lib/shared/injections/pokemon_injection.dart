import 'package:get_it/get_it.dart';
import 'package:pokemon_app/features/pokemon/data/datasources/remote/pokemon_datasource.dart';
import 'package:pokemon_app/features/pokemon/data/datasources/remote/pokemon_datasource.imp.dart';
import 'package:pokemon_app/features/pokemon/data/repositories/pokemon_repository_imp.dart';
import 'package:pokemon_app/features/pokemon/domain/repositories/pokemon_repository.dart';
import 'package:pokemon_app/features/pokemon/domain/usecases/get_one_pokemon.usecase.dart';
import 'package:pokemon_app/features/pokemon/domain/usecases/list_pokemon.usecase.dart';
import 'package:pokemon_app/features/pokemon/presentation/bloc/get_one_pokemon/get_one_pokemon_bloc.dart';
import 'package:pokemon_app/features/pokemon/presentation/bloc/list_pokemon/list_pokemon_bloc.dart';

class PokemonInjection {
  static final sl = GetIt.instance;

  PokemonInjection.init() {
    if (!sl.isRegistered<PokemonDataSource>()) {
      /// Data source
      sl.registerLazySingleton<PokemonDataSource>(
        () => PokemonDataSourceImp(),
      );

      /// Repository
      sl.registerLazySingleton<PokemonRepository>(
        () => PokemonRepositoryImp(
          remoteDataSource: sl<PokemonDataSource>(),
        ),
      );
    }

    if (!sl.isRegistered<GetOnePokemonUseCase>()) {
      /// Use case
      sl.registerLazySingleton<GetOnePokemonUseCase>(
        () => GetOnePokemonUseCase(
          repository: sl<PokemonRepository>(),
        ),
      );
    }

    if (!sl.isRegistered<ListPokemonUseCase>()) {
      /// Use case
      sl.registerLazySingleton<ListPokemonUseCase>(
        () => ListPokemonUseCase(
          repository: sl<PokemonRepository>(),
        ),
      );
    }

    if (!sl.isRegistered<GetOnePokemonBloc>()) {
      /// Bloc
      sl.registerFactory<GetOnePokemonBloc>(
        () => GetOnePokemonBloc(
          useCase: sl<GetOnePokemonUseCase>(),
        ),
      );
    }

    if (!sl.isRegistered<ListPokemonBloc>()) {
      /// Bloc
      sl.registerFactory<ListPokemonBloc>(
        () => ListPokemonBloc(
          listUseCase: sl<ListPokemonUseCase>(),
        ),
      );
    }
  }
}
