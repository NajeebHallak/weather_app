import 'package:dio/dio.dart';

import 'package:six_tharwat_samy_weather/helpe/api.dart';

import '../models/weatherModel.dart';

class WeatherService {
  final Dio dio;
  WeatherService(this.dio);
  String baseYrl = 'https://api.weatherapi.com/v1';
  String apiKey = '0e87bb57e82b40efafb235452241410';
  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    Map<String, dynamic> theData = await Api(dio).get(
        url: '${baseYrl}/forecast.json?key=${apiKey}&q=${cityName}&days=3');

    // if (response.statusCode == 200) {
    //   WeatherModel weatherModwl = WeatherModel.fromJson(response.data);
    //   return weatherModwl;
    // } else {
    //   throw Exception(response.data["error"]['message']);
    // }
    WeatherModel weatherModwl = WeatherModel.fromJson(theData);
    return weatherModwl;
  }
}
