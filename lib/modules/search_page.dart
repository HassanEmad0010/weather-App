import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/componants/shared_componant/componant.dart';
import 'package:weather_app/cubic/WeatherCubic/Weather_cubit.dart';
import 'package:weather_app/cubic/WeatherCubic/Weather_state.dart';
import 'package:weather_app/models/weathe_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatelessWidget {

  var textEditingController =TextEditingController();

  var textFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubit,WeatherState>(
      listener: (context,state){


      },
      builder:(context,state)=> Scaffold(
        backgroundColor: Colors.lightBlue,
        appBar: AppBar(
          title:const Text("Weather Application",style: TextStyle(letterSpacing: 2.67),),
          centerTitle: true,
          titleSpacing: 3,


        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           const Spacer(flex: 8,),
            const Text("Enter a City",style: TextStyle(fontSize: 30,color: Colors.white60,wordSpacing: 4,fontWeight: FontWeight.bold),),
            const Spacer(flex: 1,),
           Form(
              key: textFormKey,
              child: TextFormField(

                controller: textEditingController,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "title Cant be empty";
                    }
                    return null;
                  },

                  decoration: InputDecoration(
                    labelText: "City Name",
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      gapPadding: 10,
                      borderRadius:  BorderRadius.circular( 70.0),
                      borderSide:  const BorderSide(
                        width: 70,
                        color: Colors.yellowAccent,
                      ),
                    ),
                      prefixIconColor: Colors.indigo,
                      prefixIcon: Icon(Icons.search_sharp)
                    //fillColor: Colors.green
                  ),


                onFieldSubmitted: (value) {
                  //await BlocProvider.of<WeatherCubit>(context).getWeather(cityName: value);
                  if (textFormKey.currentState!.validate()) {
                    WeatherCubit.get(context).getWeather(cityName: value).then((
                        value) {
                      Navigator.pop(context);
                    }).catchError((e) {
                      print(" _____from search error $e");
                      WeatherCubit.get(context).failedWeather();
                      Navigator.pop(context);
                    });
                  }

                }


              ),
            ),
            const   Spacer(flex: 9,),
          ],
        ),
      ),
    );
  }
}
