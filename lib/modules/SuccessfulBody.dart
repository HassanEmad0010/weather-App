
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../cubic/WeatherCubic/Weather_cubit.dart';
import '../models/weathe_model.dart';

class SuccessWeatherWidget extends StatelessWidget {
  const SuccessWeatherWidget({
    Key? key,
    required this.cubit,
    required this.weatherModel,
  }) : super(key: key);

  final WeatherCubit cubit;
  final WeatherModel? weatherModel;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        //  mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "${cubit.cityNameCubit}",
            style: const TextStyle(fontSize: 40),
          ),
          Text("${cubit.weather?.temp}", style: const TextStyle(fontSize: 40)),
          const Icon(
            Icons.cloud_outlined,
            size: 80,
          ),
          const Text("Updated: ", style: TextStyle(fontSize: 23)),
          Text("${weatherModel?.date}", style: const TextStyle(fontSize: 27)),
          const SizedBox(
            height: 9,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("   Min: ${cubit.weather?.minTemp} - ",
                  style: TextStyle(fontSize: 20)),
              Text(" Max: ${cubit.weather?.maxTemp}",
                  style: TextStyle(fontSize: 20)),
            ],
          ),
          const SizedBox(
            height: 13,
          ),
          Text("${cubit.weather?.weatherStateName}",
              style: TextStyle(fontSize: 40)),
        ],
      ),
    );
  }
}
