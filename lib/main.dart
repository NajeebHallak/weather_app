import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:six_tharwat_samy_weather/cubit/get_weather_cubit/get-weather_cubit.dart';
import 'package:six_tharwat_samy_weather/cubit/get_weather_cubit/get_weather_state.dart';

import 'package:six_tharwat_samy_weather/views/home_view.dart';

import 'cubit/forecast_cubit/forecast_cubit_cubit.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetWeattherCubit(),
        ),
        BlocProvider(
          create: (context) => GetForecastCubit(),
        )
      ],
      child: Builder(
        builder: (context) => BlocBuilder<GetWeattherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                colorScheme: ColorScheme.fromSwatch(
                  primarySwatch: getThemeColor(
                    BlocProvider.of<GetWeattherCubit>(context)
                        .weatherModel
                        ?.weatherCondition,
                  ),
                ),
              ),
              debugShowCheckedModeBanner: false,
              home: const HomeView(),
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  } else {
    switch (condition.toLowerCase()) {
      case 'sunny':
        return Colors.orange;
      case 'clear':
        return Colors.orange;
      case 'partly cloudy':
        return Colors.grey;
      case 'cloudy':
        return Colors.grey;
      case 'overcast':
        return Colors.grey;
      case 'mist':
        return Colors.blueGrey;
      case 'fog':
        return Colors.blueGrey;
      case 'freezing fog':
        return Colors.blueGrey;
      case 'patchy rain possible':
      case 'patchy light rain':
      case 'light rain':
      case 'moderate rain at times':
      case 'moderate rain':
      case 'heavy rain at times':
      case 'heavy rain':
      case 'light freezing rain':
      case 'moderate or heavy freezing rain':
      case 'light rain shower':
      case 'moderate or heavy rain shower':
      case 'torrential rain shower':
      case 'patchy light rain with thunder':
      case 'moderate or heavy rain with thunder':
        return Colors.blue;
      case 'patchy snow possible':
      case 'patchy light snow':
      case 'light snow':
      case 'patchy moderate snow':
      case 'moderate snow':
      case 'patchy heavy snow':
      case 'heavy snow':
      case 'light snow showers':
      case 'moderate or heavy snow showers':
      case 'patchy light snow with thunder':
      case 'moderate or heavy snow with thunder':
        return Colors.lightBlue;
      case 'patchy sleet possible':
      case 'light sleet':
      case 'moderate or heavy sleet':
      case 'light sleet showers':
      case 'moderate or heavy sleet showers':
      case 'light showers of ice pellets':
      case 'moderate or heavy showers of ice pellets':
        return Colors.lightBlue;
      case 'thundery outbreaks possible':
      case 'blowing snow':
      case 'blizzard':
      case 'ice pellets':
        return Colors.purple;
      case 'patchy freezing drizzle possible':
      case 'patchy light drizzle':
      case 'light drizzle':
      case 'freezing drizzle':
      case 'heavy freezing drizzle':
        return Colors.blue;
      default:
        return Colors.teal;
    }
  }
}
