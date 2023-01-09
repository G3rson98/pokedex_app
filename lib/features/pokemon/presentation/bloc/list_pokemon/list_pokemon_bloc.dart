import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/pokemon_response.entity.dart';
import '../../../domain/usecases/list_pokemon.usecase.dart';

part 'list_pokemon_event.dart';
part 'list_pokemon_state.dart';

class ListPokemonBloc extends Bloc<ListPokemonEvent, ListPokemonState> {
  final ListPokemonUseCase listUseCase;
  ListPokemonBloc({
    required this.listUseCase,
  }) : super(const ListPokemonInitial()) {
    on<ListPokemon>(_listPokemon);
  }

  _listPokemon(
    ListPokemon event,
    Emitter<ListPokemonState> emit,
  ) async {
    final response = await listUseCase.call(offset: state.pagination);
    emit(ListPokemonSuccess(
      pokemons: [...state.pokemons, ...response],
      pagination: state.pagination + 20,
    ));
  }
}
