import 'package:flutter/material.dart';
import 'package:six_tharwat_samy_weather/widget/the_image_and_temp.dart';

import '../models/forecast_model.dart';

class ListViewForecast extends StatelessWidget {
  const ListViewForecast({
    super.key,
    required this.forecastModel,
  });

  final List<ForecastModel> forecastModel;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: forecastModel.length,
        itemBuilder: (context, index) =>
            TheImageAndTemp(forecastModel: forecastModel[index]),
      ),
    );
  }
}
