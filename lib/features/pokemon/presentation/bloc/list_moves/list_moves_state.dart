part of 'list_moves_bloc.dart';

class ListMovesState extends Equatable {
  final List<Moves> moves;
  final int pagination;
  const ListMovesState({required this.moves, this.pagination = 0});

  @override
  List<Object> get props => [moves];
}

class ListMovesInitial extends ListMovesState {
  const ListMovesInitial({super.moves = const []});
}

class ListMovesLoading extends ListMovesState {
  const ListMovesLoading({super.moves = const []});
}

class ListMovesSuccess extends ListMovesState {
  const ListMovesSuccess({required super.moves, required super.pagination});
}

class ListMovesFailure extends ListMovesState {
  const ListMovesFailure({super.moves = const []});
}
