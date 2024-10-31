import 'package:flutter/material.dart';
import 'package:six_tharwat_samy_weather/models/weatherModel.dart';

class TheImageAndTempView extends StatelessWidget {
  const TheImageAndTempView({
    super.key,
    required this.weatherModel,
  });

  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 70,
          width: 70,
          child: weatherModel.image == null
              ? Image.asset(
                  'assets/images/cloudy.png',
                )
              : Image.network('https:${weatherModel.image}'),
        ),
        Text(
          '${weatherModel.temp.round()}',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 32,
          ),
        ),
        Column(
          children: [
            Text(
              'maxTemp :${weatherModel.maxTemp.round()}',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              'minTemp :${weatherModel.minTemp.round()}',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
