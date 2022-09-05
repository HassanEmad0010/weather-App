
import 'dart:convert';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../../models/weathe_model.dart';

Future<WeatherModel> weatherService (String city)
async{
  //var url = Uri.https('api.weatherapi.com', 'v1/current.json', {    'key': '{e5bd00e528e346ff8a840254213009}' , 'q': '{Cairo}'       },);
  var url = Uri.parse("http://api.weatherapi.com/v1/forecast.json?key=e5bd00e528e346ff8a840254213009&q=$city");
  var  responce = await  http.get(url);
  Map<String,dynamic> jsonData=await jsonDecode(responce.body) ;
  print ("city is $city");
   print("_____ json data from componant is $jsonData ");
  var JsonforCastData = jsonData ["forecast"]["forecastday"][0];
  var jsonCurrentData= jsonData["current"];


  WeatherModel weatherModel = WeatherModel.fromJson(JsonforCastData,jsonCurrentData);


  return weatherModel;

}



/*
  print ("date is ${weatherModel.date}");
  print ("max temp is ${weatherModel.maxTemp} ");
  print ("min temp is  ${weatherModel.minTemp} ");
  print ("temp is ${weatherModel.temp}");
  print ("state is  ${weatherModel.weatherStateName}");
*/





// print("response date is $temp ");

