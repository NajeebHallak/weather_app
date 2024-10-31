
class WeatherState {}

class InitialState extends WeatherState {}

class WeatherLoadedState extends WeatherState {}

class WeatherFuilureState extends WeatherState {
  WeatherFuilureState({required this.theError});
  final String theError;
}

class IsLoadeState extends WeatherState {}
