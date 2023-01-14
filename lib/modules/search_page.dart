import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/componants/shared_componant/MediaQuery.dart';
import 'package:weather_app/cubic/WeatherCubic/Weather_cubit.dart';
import 'package:weather_app/cubic/WeatherCubic/Weather_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatelessWidget {
  var textEditingController = TextEditingController();

  var textFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var mediaQuery= MediaQuery.of(context);

    double _maxHeight=getHeightByMediaQuery(mediaQuery);
    double _maxWidth= getWidthByMediaQuery(mediaQuery);
    double _iconSize= getIconSizeByMediaQuery(mediaQuery);
    double _textFontSize = getTextSizeByMediaQuery(mediaQuery);


    return BlocConsumer<WeatherCubit, WeatherState>(
      listener: (context, state) {},
      builder: (context, state) => Scaffold(
        backgroundColor: Colors.lightBlue,
        appBar: AppBar(
          title:  Text(
            "Wootor",
            style: TextStyle(letterSpacing: 10,color: Colors.lightGreenAccent,
                fontSize: _textFontSize/1.1),
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

                 Text(
                  "Enter your City",
                  style: TextStyle(
                      fontSize: _textFontSize,
                      color: Colors.white60,
                      wordSpacing: 4,
                      fontWeight: FontWeight.bold),
                ),

                Padding(
                  padding:  EdgeInsets.all(_maxWidth/20),
                  child: Form(
                    key: textFormKey,
                    child: TextFormField(
                        controller: textEditingController,
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "City Name Can't be empty!";
                          }
                          return null;
                        },
                        decoration: InputDecoration(

                            labelText: "City Name",
                            fillColor: Colors.white,
                            suffixIcon:const Icon(Icons.location_city),
                            border: OutlineInputBorder(
                              gapPadding: _maxWidth/30,
                              borderRadius: BorderRadius.circular(_maxWidth),
                              borderSide:  BorderSide(
                                width: _maxWidth,
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
