import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/forecast_cubit/forecast_cubit_cubit.dart';
import '../main.dart';
import '../models/forecast_model.dart';
import 'list_view_forecast.dart';
import 'the_name_city.dart';

class ForecastInfo extends StatelessWidget {
  const ForecastInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<ForecastModel> forecastModel =
        BlocProvider.of<GetForecastCubit>(context).forecastModel
            as List<ForecastModel>;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text(
          'Weather App',
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_sharp),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              getThemeColor(forecastModel[0].forecastCondition)[600]!,
              getThemeColor(forecastModel[0].forecastCondition)[200]!,
              getThemeColor(forecastModel[0].forecastCondition)[50]!,
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 25,
              width: MediaQuery.of(context).size.width,
            ),
            TheNameCity(forecastModel: forecastModel[0]),
            ListViewForecast(forecastModel: forecastModel),
          ],
        ),
      ),
    );
  }
}
