import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:six_tharwat_samy_weather/cubit/get_weather_cubit/get-weather_cubit.dart';
import 'package:six_tharwat_samy_weather/cubit/get_weather_cubit/get_weather_state.dart';

import 'package:six_tharwat_samy_weather/views/search_view.dart';

import '../widget/no_weather_body.dart';
import '../widget/weather_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text(
          'Weather App',
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SearchView(),
                ),
              );
            },
            icon: const Icon(
              Icons.search,
            ),
          ),
        ],
      ),
      body: BlocBuilder<GetWeattherCubit, WeatherState>(
        builder: (context, state) {
          if (state is InitialState) {
            return const NoWeatherBody();
          } else if (state is WeatherLoadedState) {
            return const WeatherInfoBody();
          } else if (state is IsLoadeState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return const Center(
                child: Text(
              'OPS NO DATA TRY AGAIN',
              style: TextStyle(color: Colors.black),
            ));
          }
        },
      ),
    );
  }
}
