part of 'list_pokemon_bloc.dart';

class ListPokemonState extends Equatable {
  final List<PokemonResponse> pokemons;
  final int pagination;
  const ListPokemonState({required this.pokemons, this.pagination = 0});

  @override
  List<Object> get props => [pokemons];
}

class ListPokemonInitial extends ListPokemonState {
  const ListPokemonInitial({super.pokemons = const []});
}

class ListPokemonLoading extends ListPokemonState {
  const ListPokemonLoading({super.pokemons = const []});
}

class ListPokemonSuccess extends ListPokemonState {
  const ListPokemonSuccess({required super.pokemons,required super.pagination});
}

class ListPokemonFailure extends ListPokemonState {
  const ListPokemonFailure({super.pokemons = const []});
}
