part of 'get_one_move_bloc.dart';

abstract class GetOneMoveEvent extends Equatable {
  const GetOneMoveEvent();

  @override
  List<Object> get props => [];
}

class GetOneMove extends GetOneMoveEvent {
  final String name;
  const GetOneMove({required this.name});

  @override
  List<Object> get props => [name];
}
