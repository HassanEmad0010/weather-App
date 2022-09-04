import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          ),
        ],
      ),
    );
  }
}
