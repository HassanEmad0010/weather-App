
import 'dart:convert';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../../models/weathe_model.dart';

Future<WeatherModel> weatherService (String city)
async{

  var url = Uri.parse("http://api.weatherapi.com/v1/forecast.json?key=e5bd00e528e346ff8a840254213009&q=$city");
  var  responce = await  http.get(url);
  print ("city is $city");
  //print("_____ json data from componant is $jsonData ");


  /*f(responce.statusCode == 1006)
    {
      Map<String,dynamic> jsonData=await jsonDecode(responce.body) ;
      throw Exception(jsonData["error"]["message"]);

    }*/



      Map<String,dynamic> jsonData=await jsonDecode(responce.body) ;
      var JsonforCastData =await jsonData ["forecast"]["forecastday"][0];
      var jsonCurrentData=await jsonData["current"];
      WeatherModel weatherModel = WeatherModel.fromJson(JsonforCastData,jsonCurrentData);
      print("_____ json data from componant try is $JsonforCastData ");
      return weatherModel;











}



/*
  print ("date is ${weatherModel.date}");
  print ("max temp is ${weatherModel.maxTemp} ");
  print ("min temp is  ${weatherModel.minTemp} ");
  print ("temp is ${weatherModel.temp}");
  print ("state is  ${weatherModel.weatherStateName}");
*/



//var url = Uri.https('api.weatherapi.com', 'v1/current.json', {    'key': '{e5bd00e528e346ff8a840254213009}' , 'q': '{Cairo}'       },);


// print("response date is $temp ");

