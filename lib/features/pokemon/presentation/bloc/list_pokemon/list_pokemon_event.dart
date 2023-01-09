part of 'list_pokemon_bloc.dart';

abstract class ListPokemonEvent extends Equatable {
  const ListPokemonEvent();

  @override
  List<Object> get props => [];
}

class ListPokemon extends ListPokemonEvent {
  const ListPokemon();
}
