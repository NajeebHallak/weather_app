import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/forecast_cubit/forecast_cubit_cubit.dart';
import '../widget/forecast_info.dart';

class ForecastView extends StatelessWidget {
  const ForecastView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetForecastCubit, ForecastCubitState>(
      builder: (context, state) {
        if (state is ForecastCubitSuccess) {
          return ForecastInfo();
        } else if (state is ForecastCubitFailure) {
          return Center(
              child: Text(
            ('ooppps no Data try later').toUpperCase(),
          ));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
