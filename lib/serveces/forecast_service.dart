import 'package:dio/dio.dart';
import 'package:six_tharwat_samy_weather/helpe/api.dart';

import '../models/forecast_model.dart';

class ForecastService {
  final Dio dio;

  ForecastService(this.dio);
  String baseYrl = 'https://api.weatherapi.com/v1';
  String apiKey = '0e87bb57e82b40efafb235452241410';
  Future<List<ForecastModel>> getForecastService(
      {required String cityName}) async {
    Map<String, dynamic> theData = await Api(dio)
        .get(url: '$baseYrl/forecast.json?key=$apiKey&q=$cityName&days=3');
    List<ForecastModel> forecastModel = [];
    for (int i = 0; i < 3; i++) {
      forecastModel.add(
        ForecastModel.fromJson(theData, i),
      );
    }
    return forecastModel;
  }
}
