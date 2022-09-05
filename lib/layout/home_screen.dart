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

    return  Scaffold(
      backgroundColor: Colors.orangeAccent,
      appBar: AppBar(
       title:const Text("Weather Application",style: TextStyle(letterSpacing: 2.67),),
    centerTitle: true,
    titleSpacing: 3,

    actions: [
    IconButton(
      iconSize: 37,
    color: Colors.yellowAccent,
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
      body:
        BlocBuilder<WeatherCubit,WeatherState>(
          builder: (conwdtext,state) {
           if(state is WeatherFailedState) {
             return Container(color: Colors.cyan, child: const Center(child: Text("Something went wrong \n Please search Again",style: TextStyle(fontSize: 20),)),);
           }
           else if (state is WeatherGetState)
             {
              return Center(
                 child: Column(
                   mainAxisSize: MainAxisSize.min,
                   //  mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text(
                       "${cubit.cityName}",
                       style:const TextStyle(fontSize: 40),
                     ),
                     Text("${cubit.temp}", style:const TextStyle(fontSize: 40)),
                     const Icon(
                       Icons.cloud_outlined,
                       size: 80,
                     ),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         const Text("Today: ", style: TextStyle(fontSize: 27)),
                         Text("${cubit.date}", style:const TextStyle(fontSize: 27)),
                       ],
                     ),
                     const Text("Updated : ", style: TextStyle(fontSize: 27)),
                     Text("${cubit.date}", style:const TextStyle(fontSize: 27)),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [

                         Text("   Min: ${cubit.minTemp} - ", style: TextStyle(fontSize: 20)),
                         Text(" Max: ${cubit.maxTemp}", style: TextStyle(fontSize: 20)),
                       ],
                     ),
                     Text("${cubit.weatherState}", style: TextStyle(fontSize: 40)),
                   ],
                 ),
               );
             }

           else if (state is WeatherLoadingState)
           {
             return Scaffold(

               body: Center(child: Container(child: const CircularProgressIndicator(strokeWidth: 13,color: Colors.blueAccent),)),
             );
           }
           else
           {
             return Scaffold(
               backgroundColor: Colors.teal,

               body: Center(child:
               SizedBox(width: double.infinity,
                 height: 300,
                // color: Colors.cyan,
                 child:
                 Center(child:
                 Column(
                   children: [
                    const Text ("      No Data 😑 \n \n Search for a City ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.white),),
                     IconButton(
                       iconSize: 90,
                       color: Colors.yellowAccent,
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
                     ),

                   ],
                 )),)),
             );
           }



          }
        ),

    );





  }
}
