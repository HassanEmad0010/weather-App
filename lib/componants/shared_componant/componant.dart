import 'dart:convert';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../../models/weathe_model.dart';

Future<WeatherModel> weatherService(String city) async {
  var url = Uri.parse(
      "http://api.weatherapi.com/v1/forecast.json?key=e5bd00e528e346ff8a840254213009&q=$city");
  var responce = await http.get(url);
  //print("city is $city");

  Map<String, dynamic> jsonData = await jsonDecode(responce.body);
  var JsonforCastData = await jsonData["forecast"]["forecastday"][0];
  var jsonCurrentData = await jsonData["current"];
  WeatherModel weatherModel =
      WeatherModel.fromJson(JsonforCastData, jsonCurrentData);
   return weatherModel;
}
