import 'package:flutter/material.dart';
import 'package:weather_app/cubic/WeatherCubic/Weather_cubit.dart';
import 'package:weather_app/cubic/WeatherCubic/Weather_state.dart';
import 'package:weather_app/models/weathe_model.dart';
import '../modules/SuccessfulBody.dart';
import '../modules/search_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WeatherCubit cubit = WeatherCubit.get(context);

    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        title: const Text(
          "Wootor",
          style: TextStyle(letterSpacing: 10,color: Colors.tealAccent,fontSize: 25),
        ),
        centerTitle: true,
        titleSpacing: 3,
        actions: [
          IconButton(
            iconSize: 37,
            color: Colors.yellowAccent,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SearchPage();
                  },
                ),
              );
            },
            icon: const Icon(Icons.search_outlined),
          )
        ],
      ),
      body:
          
          BlocBuilder<WeatherCubit, WeatherState>(builder: (context, state) {
        if (state is WeatherFailedState) {
          return const Center(
            child:  SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child:  Center(
                  child: Text(
                " Something went wrong \n Please Search Again",
                style: TextStyle(fontSize: 20),
              )),
            ),
          );

        } else if (state is WeatherGetState) {
          WeatherModel? weatherModel = cubit.weather;
          return Center(
            child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SuccessWeatherWidget(cubit: cubit, weatherModel: weatherModel)),
          );

        } else if (state is WeatherLoadingState) {
          return const Scaffold(
            body: Center(
                child: CircularProgressIndicator(
                  semanticsLabel: "loading......",
                    strokeWidth: 5, color: Colors.blueAccent)),
          );
        } else {
          return Scaffold(
            backgroundColor: Colors.teal,
            body: Center(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                  children: [
                  const Text(
                    "      No Data 😑 \n \n Search for a City ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.white),
                  ),
                  IconButton(
                    iconSize: 90,
                    color: Colors.yellowAccent,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return SearchPage();
                          },
                        ),
                      );
                    },
                    icon: const Icon(Icons.search_outlined),
                  ),
                  ],
              ),
                )),
          );
        }
      }),
    );
  }
}
