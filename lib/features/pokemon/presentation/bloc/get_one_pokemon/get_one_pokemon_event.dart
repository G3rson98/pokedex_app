part of 'get_one_pokemon_bloc.dart';

abstract class GetOnePokemonEvent extends Equatable {
  const GetOnePokemonEvent();

  @override
  List<Object> get props => [];
}

class GetOnePokemon extends GetOnePokemonEvent {
  final String name;
  const GetOnePokemon({required this.name});

  @override
  List<Object> get props => [name];
}
