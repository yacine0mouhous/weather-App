part of 'weither_bloc.dart';

sealed class WeitherEvent extends Equatable {
  const WeitherEvent();

  @override
  List<Object> get props => [];
}

class fetchweither extends WeitherEvent {
  final Position position;

  fetchweither(this.position);
  List<Object> get props => [position];
}
