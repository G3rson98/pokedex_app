import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/pokemon_response.entity.dart';
import '../../../domain/usecases/get_one_pokemon.usecase.dart';

part 'get_one_pokemon_event.dart';
part 'get_one_pokemon_state.dart';

class GetOnePokemonBloc extends Bloc<GetOnePokemonEvent, GetOnePokemonState> {
  final GetOnePokemonUseCase useCase;
  GetOnePokemonBloc({
    required this.useCase,
  }) : super(const GetOnePokemonInitial()) {
    on<GetOnePokemon>(_getOnePokemon);
  }

  _getOnePokemon(
    GetOnePokemon event,
    Emitter<GetOnePokemonState> emit,
  ) async {
    final response = await useCase.call(event.name);
    emit(GetOnePokemonSuccess(pokemon: response));
  }
}
