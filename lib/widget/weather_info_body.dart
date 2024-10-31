import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:six_tharwat_samy_weather/cubit/get_weather_cubit/get-weather_cubit.dart';
import 'package:six_tharwat_samy_weather/main.dart';
import 'package:six_tharwat_samy_weather/models/weatherModel.dart';
import 'package:six_tharwat_samy_weather/widget/the_image_and_temp_view.dart';
import 'custom_material_button.dart';
import 'the_name_city_view.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<GetWeattherCubit>(context).weatherModel!;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            getThemeColor(weatherModel.weatherCondition)[600]!,
            getThemeColor(weatherModel.weatherCondition)[200]!,
            getThemeColor(weatherModel.weatherCondition)[50]!,
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TheNameCityView(weatherModel: weatherModel),
          TheImageAndTempView(weatherModel: weatherModel),
          const SizedBox(
            height: 32,
          ),
          Text(
            weatherModel.weatherCondition,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
          ),
          const SizedBox(
            height: 70,
          ),
          CustomMaterialButton(
            weatherModel: weatherModel,
          ),
        ],
      ),
    );
  }
}
