import 'package:flutter/material.dart';
import 'package:football_app/baseUtils/colors.dart';

import '../Api_Manager/api_manager.dart';
import '../Models/playersmodel.dart';
import 'matchtile.dart';




class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Players> allmatches;
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor:Colors.indigo,
        elevation: 0.0,
        title: Text(
          "PROFILE",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      //now we have finished the api service let's call it
      //Now befo re we create Our layout let's create our API service
      body: FutureBuilder(
        future: SoccerApi()
            .getPlayers(), //Here we will call our getData() method,
        builder: (context, snapshot) {
          //the future builder is very intersting to use when you work with api
          if (snapshot.hasData) {
            print((snapshot.data).length);
            return ProfileBody(snapshot.data);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        }, // here we will buil the app layout
      ),
    );
  }
}
Widget ProfileBody(List<Players> allplayers) {
 return Column(
   //mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(top: 20),
        child: CircleAvatar(
          radius: 50.0,
          backgroundImage: NetworkImage(allplayers[0].player.photo),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(30.0),
        child: Text(
         allplayers[0].player.firstname,
          style: TextStyle(
            fontSize: 25.0,
            fontFamily: 'Pacifico',
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
       Padding(
         padding: const EdgeInsets.only(right: 250),
         child: Text('Cards',
           style:TextStyle(fontSize: 25.0,
             fontFamily: 'Pacifico',
             fontWeight: FontWeight.bold,
             color: Colors.black,) ,),
       ),


  Expanded(
    child: Padding(
      padding: EdgeInsets.only(left: 20,right: 10,top: 10),
      child: Row(
      // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height:20,width:20,
                      color: Colors.yellow,),
                    SizedBox(width: 28,),
                    Text(allplayers[0].statistics[0].cards.yellow.toString())
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      height:20,width:20,
                      color: Colors.red,),
                    SizedBox(width: 28,),
                    Text(allplayers[0].statistics[0].cards.red.toString())
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      height:20,width:20,
                      color: Colors.yellow,),
                    Container(
                      height:20,width:20,
                      color: Colors.red,),
                    SizedBox(width: 10,),
                    Text(allplayers[0].statistics[0].cards.yellowred.toString())
                  ],
                ),
              ),

            ],
          ),

        ],
      ),
    ),
  ),



    ],
  );


  // return Column(
  //
  //   children: [
  //     Expanded(
  //       flex: 2,
  //       child: Container(
  //         color: Colors.blue,
  //         child: Padding(
  //           padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 24.0),
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             crossAxisAlignment: CrossAxisAlignment.center,
  //             children: [
  //               playerStat(allplayers[0].statistics[0].cards.red, allplayers[0].statistics[0].cards.yellowred,
  //                   allplayers[0].statistics[0].cards.yellow),
  //
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //
  //   ],
  // );
}
Widget playerStat(int yellow, int yellowred, int red) {
  return Expanded(
    child: Column(
      children: [
        Text(
          yellow.toString(),
          style: TextStyle(
            fontSize: 18.0,
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          yellowred.toString(),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18.0,
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          red.toString(),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18.0,
          ),
        ),
      ],
    ),
  );
}


