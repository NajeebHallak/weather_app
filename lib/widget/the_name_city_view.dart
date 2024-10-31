import 'package:flutter/material.dart';
import 'package:six_tharwat_samy_weather/models/weatherModel.dart';

class TheNameCityView extends StatelessWidget {
  const TheNameCityView({
    super.key,
    required this.weatherModel,
  });

  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          weatherModel.cityName,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 32,
          ),
        ),
        Text(
          'update Att  :  ${weatherModel.date.hour}:${weatherModel.date.minute}',
          style: const TextStyle(
            fontSize: 24,
          ),
        ),
        const SizedBox(
          height: 32,
        ),
      ],
    );
  }
}
