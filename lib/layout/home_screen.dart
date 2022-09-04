import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubic/WeatherCubic/Weather_cubit.dart';
import 'package:weather_app/cubic/WeatherCubic/Weather_state.dart';
import '../modules/search_page.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext conwdtext) {
    WeatherCubit cubit = WeatherCubit.get(conwdtext);

    return BlocListener<WeatherCubit,WeatherState>(
      listener: (BuildContext context, state) {


      },
      child: Scaffold(
        backgroundColor: Colors.amber,
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  conwdtext,
                  MaterialPageRoute(
                    builder: (coegntext) {
                      return SearchPage();
                    },
                  ),
                );
              },
              icon: const Icon(Icons.search_outlined),
            )
          ],
        ),
        
        
        
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            //  mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${cubit.cityName}",
                style: TextStyle(fontSize: 40),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Updated", style: TextStyle(fontSize: 20)),
                  Text("${cubit.date}", style: TextStyle(fontSize: 20)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.cloud_outlined,
                    size: 80,
                  ),
                  Text("${cubit.minTemp}^", style: TextStyle(fontSize: 40)),
                  Text("${cubit.maxTemp}", style: TextStyle(fontSize: 20)),
                ],
              ),
              Text("${cubit.weatherState}", style: TextStyle(fontSize: 40)),
            ],
          ),
        ),
      ),
    );
  }
}
