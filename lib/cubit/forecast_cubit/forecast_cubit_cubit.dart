import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:six_tharwat_samy_weather/models/forecast_model.dart';
import 'package:six_tharwat_samy_weather/serveces/forecast_service.dart';

part 'forecast_cubit_state.dart';

class GetForecastCubit extends Cubit<ForecastCubitState> {
  GetForecastCubit() : super(ForecastCubitInitial());
  List<ForecastModel>? forecastModel;
  getForecast({required String cityName}) async {
    emit(ForecastCubitLoade());
    try {
      forecastModel =
          await ForecastService(Dio()).getForecastService(cityName: cityName);
      emit(ForecastCubitSuccess());
    } catch (e) {
      emit(ForecastCubitFailure(theFailure: e.toString()));
    }
  }
}
