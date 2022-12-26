import 'package:flutter/material.dart';




class AddsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.indigo,
        body: SafeArea(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Advertisement',style: TextStyle(color: Colors.white,fontSize: 25),),
           Padding(
             padding: const EdgeInsets.only(top: 100),
             child: Container(
                child: Image.asset('assets/images/tesla.jpeg'),
          ),
           ),
              Padding(
                padding: const EdgeInsets.only(top: 10,right: 20,left: 30),
                child: AlertDialog(
                  title: Text('Tesla Cars'),
                  content: Text('Tesla is accelerating the worlds transition to sustainable energy with electric cars'),

                ),
              )


            ],
          ),
        ),
      ),
    );
  }
}



