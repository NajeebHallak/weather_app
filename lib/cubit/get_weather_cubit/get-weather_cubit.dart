import 'package:dio/dio.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:six_tharwat_samy_weather/cubit/get_weather_cubit/get_weather_state.dart';

import '../../models/weatherModel.dart';
import '../../serveces/weather_sevice.dart';

class GetWeattherCubit extends Cubit<WeatherState> {
  GetWeattherCubit() : super(InitialState());

  WeatherModel? weatherModel;
  getWeattherCubit({required String cityName}) async {
    emit(IsLoadeState());
    try {
      weatherModel =
          await WeatherService(Dio()).getCurrentWeather(cityName: cityName);
      emit(WeatherLoadedState());
    } catch (e) {
      emit(WeatherFuilureState(theError: e.toString()));
    }
  }

}
