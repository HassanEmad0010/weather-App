import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/models/weathe_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../componants/shared_componant/componant.dart';
import 'Weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitState());

  static WeatherCubit get(context) => BlocProvider.of(context);



  WeatherModel? weather;
  String? cityNameCubit;


  Future<void> getWeather({required cityName}) async {
    emit(WeatherLoadingState());

    await weatherService(cityName).then((value) {
      emit(WeatherGetState());

      weather = value;
    }).catchError((e) {


     // print("error from cubit is ${e.toString()} ");
      emit(WeatherFailedState());
    });
  }

  void loadWeather() {
   // print("failed from cubit");
    emit(WeatherLoadingState());
  }

  void failedWeather() {
  //  print("failed from cubit");
    emit(WeatherFailedState());
  }




String getAssetImage()
{

      if(weather!.weatherStateName.contains("Sunny")) {
        return "assets/images/clear.png";
      } else if(weather!.weatherStateName.contains("rain")) {
        return"assets/images/rainy.png";
      } else if(weather!.weatherStateName.contains("thunder")) {
        return"assets/images/thunderstorm.png";
      } else if(weather!.weatherStateName.contains("Patchy")) {
        return"assets/images/thunderstorm.png";
      } else if(weather!.weatherStateName.contains("outbreaks")) {
        return"assets/images/thunderstorm.png";
      } else if(weather!.weatherStateName.contains("cloudy")) {
        return"assets/images/cloudy.png";
      }
      else if(weather!.weatherStateName.contains("snow")) {
        return"assets/images/snow.png";

      }else {
        return "assets/images/clear.png";
      }



}

  MaterialColor getColor()
  {
    if(weather?.weatherStateName=="Sunny") {
      return Colors.yellow;
    } else if(weather?.weatherStateName=="Moderate rain") {
      return Colors.blue;
    } else if(weather?.weatherStateName=="Patchy light rain with thunder") {
      return Colors.cyan;
    } else if(weather?.weatherStateName=="Patchy rain possible") {
      return Colors.indigo;
    } else if(weather?.weatherStateName=="Thundery outbreaks possible") {
      return Colors.red;
    } else {
      return Colors.yellow;
    }
  }




}