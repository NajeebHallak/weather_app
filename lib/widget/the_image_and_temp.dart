import 'package:flutter/widgets.dart';
import 'package:six_tharwat_samy_weather/main.dart';
import 'package:six_tharwat_samy_weather/models/forecast_model.dart';

class TheImageAndTemp extends StatelessWidget {
  const TheImageAndTemp({
    super.key,
    required this.forecastModel,
  });

  final ForecastModel forecastModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 40,
          ),
          Text(
            'The Date Att :  ${forecastModel.date.day}/${forecastModel.date.month}',
            style: const TextStyle(
              fontSize: 24,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 70,
                width: 70,
                child: forecastModel.image == null
                    ? Image.asset(
                        'assets/images/cloudy.png',
                      )
                    : Image.network('https:${forecastModel.image}'),
              ),
              Text(
                '${forecastModel.temp.round()}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
              Column(
                children: [
                  Text(
                    'maxTemp :${forecastModel.maxTemp.round()}',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'minTemp :${forecastModel.minTemp.round()}',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Text(
            forecastModel.forecastCondition,
            style: const TextStyle(
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}
