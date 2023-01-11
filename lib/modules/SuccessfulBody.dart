
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
          Text("${cubit.weather?.temp.round()} ", style: const TextStyle(fontSize: 40)),

          Image.asset(cubit.getAssetImage()),



          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("   Min: ${cubit.weather?.minTemp.round()} - ",
                  style: const TextStyle(fontSize: 20)),
              Text(" Max: ${cubit.weather?.maxTemp.round()}",
                  style: const TextStyle(fontSize: 20)),
            ],
          ),

          Text("${cubit.weather?.weatherStateName}",
              style: TextStyle(fontSize: 30)),

          const Text("Last Updated: ", style: TextStyle(fontSize: 23)),
          Text("${weatherModel?.date}", style: const TextStyle(fontSize: 27)),
        ],
      ),
    );
  }

}
/*  String getAssetImage()
  {
    if(cubit.weather?.weatherStateName=="Sunny")
      return "assets/images/clear.png";

    else if(cubit.weather?.weatherStateName=="Moderate rain")
      return"assets/images/rainy.png";

    else if(cubit.weather?.weatherStateName=="Patchy light rain with thunder")
      return"assets/images/thunderstorm.png";

    else if(cubit.weather?.weatherStateName=="Patchy rain possible")
      return"assets/images/thunderstorm.png";

    else if(cubit.weather?.weatherStateName=="Thundery outbreaks possible")
      return"assets/images/thunderstorm.png";
    else
      return "assets/images/clear.png";

}*/


