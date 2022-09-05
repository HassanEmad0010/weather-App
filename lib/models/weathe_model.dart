


import 'package:flutter/foundation.dart';

class WeatherModel{


   String date;
   double temp;
   double maxTemp;
   double minTemp;
   String weatherStateName;


  WeatherModel(  {required this.date, required this.temp,required this.maxTemp,required this.minTemp,required this.weatherStateName});


 factory  WeatherModel.fromJson(dynamic json,dynamic jsonCurrent)
  {
    var jsonDayData = json["day"];
   // var jsonCurrentData= jsonCurrent["last_updated"];

return WeatherModel(
    date: jsonCurrent["last_updated"],
    temp: jsonCurrent["temp_c"],
    maxTemp: jsonDayData["maxtemp_c"],
  minTemp: jsonDayData["mintemp_c"],
  weatherStateName: jsonDayData["condition"]["text"],
);
  }

@override
  String toString() {
    // TODO: implement toString
    return "temp= $temp, date= $date, max=$maxTemp, min = $minTemp, state= $weatherStateName  ";
  }
}