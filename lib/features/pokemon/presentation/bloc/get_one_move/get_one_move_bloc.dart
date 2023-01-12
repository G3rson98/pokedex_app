import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/moves_response.entity.dart';
import '../../../domain/usecases/get_one_move.usecase.dart';

part 'get_one_move_event.dart';
part 'get_one_move_state.dart';

class GetOneMoveBloc extends Bloc<GetOneMoveEvent, GetOneMoveState> {
  final GetOneMoveUseCase useCase;
  GetOneMoveBloc({
    required this.useCase,
  }) : super(const GetOneMoveInitial()) {
    on<GetOneMove>(_getOneMove);
  }

  _getOneMove(
    GetOneMove event,
    Emitter<GetOneMoveState> emit,
  ) async {
    final response = await useCase.call(event.name);
    emit(GetOneMoveSuccess(moves: response));
  }
}
