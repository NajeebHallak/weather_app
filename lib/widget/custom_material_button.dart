import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:six_tharwat_samy_weather/cubit/forecast_cubit/forecast_cubit_cubit.dart';
import 'package:six_tharwat_samy_weather/models/weatherModel.dart';
import 'package:six_tharwat_samy_weather/views/forecast_for_days_view.dart';
import '../main.dart';

class CustomMaterialButton extends StatelessWidget {
  const CustomMaterialButton({
    super.key,
    required this.weatherModel,
  });
  final WeatherModel weatherModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: getThemeColor(weatherModel.weatherCondition)[300],
        boxShadow: [
          BoxShadow(
              blurRadius: 60,
              spreadRadius: 5,
              color: Colors.grey.withOpacity(0.5),
              offset: const Offset(3, 3)),
        ],
      ),
      child: MaterialButton(
        minWidth: double.infinity,
        height: 50,
        onPressed: () {
          BlocProvider.of<GetForecastCubit>(context)
              .getForecast(cityName: weatherModel.cityName);
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>const ForecastView(),
              ));
        },
        child: const Text(
          'Three-day forecast',
          style: TextStyle(
            fontSize: 25,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
