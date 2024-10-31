import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:six_tharwat_samy_weather/cubit/get_weather_cubit/get-weather_cubit.dart';

class TextFormFildSearch extends StatelessWidget {
  const TextFormFildSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onSubmitted: (value) {
          var getWeatherCubit = BlocProvider.of<GetWeattherCubit>(context);
          getWeatherCubit.getWeattherCubit(cityName: value);
          Navigator.pop(context);
        },
        keyboardType: TextInputType.name,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(20),
          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(),
          ),
          hintText: 'Enter City Name',
          hintStyle: TextStyle(fontSize: 25),
          labelText: 'Search',
          labelStyle: TextStyle(fontSize: 25),
          suffixIcon: Icon(
            Icons.search,
            size: 25,
          ),
        ),
      ),
    );
  }
}
