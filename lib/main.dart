import 'package:flutter/material.dart';
import 'package:weather_app/cubic/WeatherCubic/Weather_cubit.dart';
import 'package:weather_app/cubic/WeatherCubic/Weather_state.dart';

import 'layout/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
          create:(context)=>WeatherCubit(),
          child: HomeScreen()),
    );
  }
}