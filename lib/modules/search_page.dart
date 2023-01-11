import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/cubic/WeatherCubic/Weather_cubit.dart';
import 'package:weather_app/cubic/WeatherCubic/Weather_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatelessWidget {
  var textEditingController = TextEditingController();

  var textFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubit, WeatherState>(
      listener: (context, state) {},
      builder: (context, state) => Scaffold(
        backgroundColor: Colors.lightBlue,
        appBar: AppBar(
          title: const Text(
            "Wootor",
            style: TextStyle(letterSpacing: 10,color: Colors.lightGreenAccent,fontSize: 25),
          ),
          centerTitle: true,
          titleSpacing: 3,
        ),
        body: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                const Text(
                  "Enter a City",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white60,
                      wordSpacing: 4,
                      fontWeight: FontWeight.bold),
                ),

                Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Form(
                    key: textFormKey,
                    child: TextFormField(
                        controller: textEditingController,
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "City Name Can't be empty";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            labelText: "City Name",
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              gapPadding: 10,
                              borderRadius: BorderRadius.circular(70.0),
                              borderSide: const BorderSide(
                                width: 70,
                                color: Colors.yellowAccent,
                              ),
                            ),
                            prefixIconColor: Colors.indigo,
                            prefixIcon: const Icon(Icons.search_sharp)
                            //fillColor: Colors.green
                            ),
                        onFieldSubmitted: (value) {
                          //await BlocProvider.of<WeatherCubit>(context).getWeather(cityName: value);
                          if (textFormKey.currentState!.validate()) {
                            Navigator.pop(context);
                            WeatherCubit.get(context).getWeather(cityName: value);
                            WeatherCubit.get(context).cityNameCubit = value;
                          }
                        }),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
