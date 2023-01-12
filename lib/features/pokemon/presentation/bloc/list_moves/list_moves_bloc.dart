import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/moves_response.entity.dart';
import '../../../domain/usecases/list_moves.usecase.dart';

part 'list_moves_event.dart';
part 'list_moves_state.dart';

class ListMovesBloc extends Bloc<ListMovesEvent, ListMovesState> {
  final ListMovesUseCase listUseCase;
  ListMovesBloc({
    required this.listUseCase,
  }) : super(const ListMovesInitial()) {
    on<ListMoves>(_listMoves, transformer: droppable());
  }

  _listMoves(
    ListMoves event,
    Emitter<ListMovesState> emit,
  ) async {
    final response = await listUseCase.call(offset: state.pagination);
    emit(ListMovesSuccess(
      moves: [...state.moves, ...response],
      pagination: state.pagination + 20,
    ));
  }
}
