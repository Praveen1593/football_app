import 'package:flutter/material.dart';
import 'package:football_app/Screens/initialScreen.dart';
import 'package:football_app/Screens/pagebody.dart';

import 'Api_Manager/api_manager.dart';
import 'flashscreen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FlashScreen(),
    );
  }
}

//So as we can see w got our matches data,
// the data size depend on the date and the time so
// you can get as many data as many matches are curetly playing
//Now let's try to get data by seasons and leagues