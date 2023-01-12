part of 'get_one_move_bloc.dart';

abstract class GetOneMoveState extends Equatable {
  const GetOneMoveState();

  @override
  List<Object> get props => [];
}

class GetOneMoveInitial extends GetOneMoveState {
  const GetOneMoveInitial();
}

class GetOneMoveLoading extends GetOneMoveState {
  const GetOneMoveLoading();
}

class GetOneMoveSuccess extends GetOneMoveState {
  final Moves moves;
  const GetOneMoveSuccess({
    required this.moves,
  });

  @override
  List<Object> get props => [moves];
}

class GetOneMoveFailure extends GetOneMoveState {
  const GetOneMoveFailure();
}
