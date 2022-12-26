import 'package:flutter/material.dart';
import 'package:football_app/Screens/initialScreen.dart';
import 'baseUtils/colors.dart';
import 'baseUtils/constants.dart';



class FlashScreen extends StatefulWidget {
  const FlashScreen({Key key}) : super(key: key);

  @override
  State<FlashScreen> createState() => FlashScreenState();
}

class FlashScreenState extends State<FlashScreen> {
  int widgetId = 0;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds:10),(){
      print("After 3 seconds");
      Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  const InitialScreen()));
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Align(
        alignment: Alignment.center,
        child: Container(
          width: getDeviceWidthByPercentage(30, context) ,
          height: getDeviceHeightByPercentage(30, context) ,

          child: AnimatedSwitcher(
            duration:const Duration(milliseconds: 500),
            child: Image.asset('assets/images/football.jpeg'),
          ),
        ),
      ),
    );
  }
}
