import 'package:flutter/animation.dart';
import 'package:weather_app/models/weathe_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../componants/shared_componant/componant.dart';
import 'Weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {

  WeatherCubit():super(WeatherInitState());

 static WeatherCubit get (context)=>BlocProvider.of(context);

  String? date;
  double? temp;
  double? maxTemp;
  double? minTemp;
  String? weatherState;

  WeatherModel? weather;
  String? cityNameCubit;

  Future<void> getWeather ({required cityName}) async{
    emit(WeatherLoadingState());


     await  weatherService(cityName).then((value) {
       emit(WeatherGetState());

       return weather;

     }).catchError((e){ print("error from cubit is ${e.toString()} ");
     emit(WeatherFailedState());
     });






  }


  void loadWeather ()
  {
    print("failed from cubit");
    emit(WeatherLoadingState());
  }

  void failedWeather ()
  {
    print("failed from cubit");
    emit(WeatherFailedState());
  }




}