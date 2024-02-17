part of 'weither_bloc.dart';

sealed class WeitherState extends Equatable {
  const WeitherState();

  @override
  List<Object> get props => [];

  get weather => null;
}

final class WeitherInitial extends WeitherState {}

final class WeitherblocloadingState extends WeitherState {}

final class WeitherBlocFailureState extends WeitherState {}

final class WeitherBlocSucces extends WeitherState {
  final Weather weather;

  WeitherBlocSucces(this.weather);
  List<Object> get props => [weather];
}
