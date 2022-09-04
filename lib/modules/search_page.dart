import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/componants/shared_componant/componant.dart';
import 'package:weather_app/cubic/WeatherCubic/Weather_cubit.dart';
import 'package:weather_app/cubic/WeatherCubic/Weather_state.dart';
import 'package:weather_app/models/weathe_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubit,WeatherState>(
      listener: (context,state){


      },
      builder:(context,state)=> Scaffold(
        backgroundColor: Colors.cyan,
        appBar: AppBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Enter your City",style: TextStyle(fontSize: 30,color: Colors.white60,wordSpacing: 4,fontWeight: FontWeight.bold),),
            TextFormField(
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 3,
                    color: Colors.indigo,
                  ),
                ),
                prefixIconColor: Colors.indigo,
                fillColor: Colors.white60,
                prefixIcon: Icon(Icons.search_sharp),

              ),

              onFieldSubmitted: (value){
                //await BlocProvider.of<WeatherCubit>(context).getWeather(cityName: value);
                WeatherCubit.get(context).getWeather(cityName: value).then((value) {

                  Navigator.pop(context);

                });
                },


            ),
          ],
        ),
      ),
    );
  }
}
