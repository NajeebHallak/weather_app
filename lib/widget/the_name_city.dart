import 'package:flutter/material.dart';

import '../models/forecast_model.dart';

class TheNameCity extends StatelessWidget {
  const TheNameCity({
    super.key,
    required this.forecastModel,
  });

  final ForecastModel forecastModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          forecastModel.cityName,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 32,
          ),
        ),
        Text(
          'update Att  :  ${forecastModel.date.hour}:${forecastModel.date.minute}',
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
