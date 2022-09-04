
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
  Map<String,dynamic> jsonData= jsonDecode(responce.body) ;

  //var localTime = jsonData["location"]["localtime"];
   // print("response localTime is $localTime ");
 // var jsonFinaldata = jsonData ["forecast"]["forecastday"][0]["day"];

  var jsonFinaldata1 = jsonData ["forecast"]["forecastday"][0];


  WeatherModel weatherModel = WeatherModel.fromJson(jsonFinaldata1);




/*
  print ("date is ${weatherModel.date}");
  print ("max temp is ${weatherModel.maxTemp} ");
  print ("min temp is  ${weatherModel.minTemp} ");
  print ("temp is ${weatherModel.temp}");
  print ("state is  ${weatherModel.weatherStateName}");
*/





 // print("response date is $temp ");

    print ("city is $city");

return weatherModel;
}





