part of 'list_moves_bloc.dart';

abstract class ListMovesEvent extends Equatable {
  const ListMovesEvent();

  @override
  List<Object> get props => [];
}

class ListMoves extends ListMovesEvent {
  const ListMoves();
}
