
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../componants/shared_componant/MediaQuery.dart';
import '../componants/shared_componant/componant.dart';
import '../cubic/WeatherCubic/Weather_cubit.dart';
import '../models/weathe_model.dart';

class SuccessWeatherWidget extends StatelessWidget {

   SuccessWeatherWidget({
    Key? key,
    required this.cubit,
    required this.weatherModel,
  }) : super(key: key);

  final WeatherCubit cubit;
  final WeatherModel? weatherModel;

  @override
  Widget build(BuildContext context) {

    var mediaQuery= MediaQuery.of(context);
    double _maxHeight=getHeightByMediaQuery(mediaQuery);
    double _maxWidth= getWidthByMediaQuery(mediaQuery);
    double _iconSize= getIconSizeByMediaQuery(mediaQuery);
    double _textFontSize = getTextSizeByMediaQuery(mediaQuery);

    var arr_cities = ['ibshadat','mallawi','minia','d','e'];
bool isMine=false;
    if(arr_cities.contains(cubit.cityNameCubit))
      {
       // print ("done");
        isMine=true;
      }


    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        //  mainAxisAlignment: MainAxisAlignment.center,
        children: [



          isMine?  Text(
      "  ${cubit.cityNameCubit} city \n"
          "💪احسن ناس",
        style: TextStyle(fontSize: _textFontSize*1.4,color: Colors.yellowAccent),
      ):
          Text(
          "${cubit.cityNameCubit} city",
           style: TextStyle(fontSize: _textFontSize*1.4,color: Colors.yellowAccent),
            ),

          sizedBoxSeparator(height: _maxHeight/30),
          Text("${cubit.weather?.temp.round()}ْ",
              style: TextStyle(fontSize: _textFontSize*1.9,color: Colors.lightGreenAccent)),
          sizedBoxSeparator(height: _maxHeight/30),
          Image.asset(cubit.getAssetImage(),fit: BoxFit.fill,height: _maxWidth/1.6,),

          sizedBoxSeparator(height: _maxHeight/30),

          Text("${cubit.weather?.weatherStateName}",
              style: weatherTextStyle(fontsize: _textFontSize,color: Colors.lightGreenAccent)),
          sizedBoxSeparator(height: _maxHeight/30),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text("   Min: ${cubit.weather?.minTemp.round()}°",
        style: weatherTextStyle(fontsize: _textFontSize)),
              Text(" Max: ${cubit.weather?.maxTemp.round()}°",
                  style:   weatherTextStyle(fontsize: _textFontSize)),
            ],
          ),


        /*   Text("Last Updated: ", style: weatherTextStyle(fontsize: _textFontSize/1.3)),
          Text("${weatherModel?.date}", style: weatherTextStyle(fontsize: _textFontSize/1.2,color: Colors.lightGreenAccent)),
        */
        ],
      ),
    );
  }

}
/*  String getAssetImage()
  {
    if(cubit.weather?.weatherStateName=="Sunny")
      return "assets/images/clear.png";

    else if(cubit.weather?.weatherStateName=="Moderate rain")
      return"assets/images/rainy.png";

    else if(cubit.weather?.weatherStateName=="Patchy light rain with thunder")
      return"assets/images/thunderstorm.png";

    else if(cubit.weather?.weatherStateName=="Patchy rain possible")
      return"assets/images/thunderstorm.png";

    else if(cubit.weather?.weatherStateName=="Thundery outbreaks possible")
      return"assets/images/thunderstorm.png";
    else
      return "assets/images/clear.png";

}*/


