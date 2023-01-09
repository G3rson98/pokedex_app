part of 'get_one_pokemon_bloc.dart';

abstract class GetOnePokemonState extends Equatable {
  const GetOnePokemonState();

  @override
  List<Object> get props => [];
}

class GetOnePokemonInitial extends GetOnePokemonState {
  const GetOnePokemonInitial();
}

class GetOnePokemonLoading extends GetOnePokemonState {
  const GetOnePokemonLoading();
}

class GetOnePokemonSuccess extends GetOnePokemonState {
  final PokemonResponse pokemon;
  const GetOnePokemonSuccess({
    required this.pokemon,
  });

  @override
  List<Object> get props => [pokemon];
}

class GetOnePokemonFailure extends GetOnePokemonState {
  const GetOnePokemonFailure();
}
