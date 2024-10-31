part of 'forecast_cubit_cubit.dart';

@immutable
sealed class ForecastCubitState {}

final class ForecastCubitInitial extends ForecastCubitState {}

final class ForecastCubitSuccess extends ForecastCubitState {}

final class ForecastCubitFailure extends ForecastCubitState {
  final String theFailure;

  ForecastCubitFailure({required this.theFailure});
}

final class ForecastCubitLoade extends ForecastCubitState {}
