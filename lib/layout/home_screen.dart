import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../modules/search_page.dart';

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

   return Scaffold(
     backgroundColor: Colors.amber,
     appBar: AppBar(

       actions: [
         IconButton(onPressed: (){

           Navigator.push(context,MaterialPageRoute(
           builder: (context){
             return SearchPage();
   },


   ),);

         },
             icon:const Icon(Icons.search_outlined) ,

         )],

     ),

     body: Center(
       child: Column(

         mainAxisSize: MainAxisSize.min,
       //  mainAxisAlignment: MainAxisAlignment.center,
         children: [

         Text("Minia",style: TextStyle(fontSize: 40),),

         Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [ Text("Updated",style: TextStyle(fontSize: 20)), Text("10:20",style: TextStyle(fontSize: 20)), ],),

         Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [ Icon(Icons.cloud_outlined,size: 80,), Text("37^",style: TextStyle(fontSize: 40)), Text("max",style: TextStyle(fontSize: 20)), ],),

         Text("Light rain",style: TextStyle(fontSize: 40)),




       ],),
     ),




   );
  }








}