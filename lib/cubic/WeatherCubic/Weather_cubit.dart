import 'package:flutter/animation.dart';
import 'package:weather_app/models/weathe_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../componants/shared_componant/componant.dart';
import 'Weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {

  WeatherCubit():super(WeatherInitState());

  String? date;
  double? temp;
  double? maxTemp;
  double? minTemp;
  String? weatherState;



  Future<void> getWeather ({required cityName}) async{
    WeatherModel weather =await  weatherService(cityName);
    print ("weather from search page ${weather.toString()} ");
    minTemp = weather.minTemp;
    maxTemp= weather.maxTemp;
    temp = weather.temp;
    date= weather.date;
    weatherState= weather.weatherStateName;
    emit(WeatherSuccessfulState());

  print ("date is $date");
  print ("max temp is $maxTemp ");
  print ("min temp is  $temp ");
  print ("temp is $minTemp");
  print ("state is  $weatherState");






  }




}