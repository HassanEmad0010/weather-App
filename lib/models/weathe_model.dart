


import 'package:flutter/foundation.dart';

class WeatherModel{


   String date;
   double temp;
   double maxTemp;
   double minTemp;
   String weatherStateName;


  WeatherModel(  {required this.date, required this.temp,required this.maxTemp,required this.minTemp,required this.weatherStateName});


 factory  WeatherModel.fromJson(dynamic json)
  {
    var jsonFinaldata = json["day"];

return WeatherModel(
    date: json["date"],
    temp:jsonFinaldata["maxtemp_c"] ,
    maxTemp: jsonFinaldata["maxtemp_c"],
  minTemp: jsonFinaldata["mintemp_c"],
  weatherStateName: jsonFinaldata["condition"]["text"],
);
  }

@override
  String toString() {
    // TODO: implement toString
    return "temp= $temp, date= $date, max=$maxTemp, min = $minTemp, state= $weatherStateName  ";
  }
}