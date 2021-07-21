import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:kalkulator_bmi/home.dart';

class SplashScreen extends StatefulWidget {

  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen>{

  void initState(){
    super.initState();
    splashscreenStart();
  }

  splashscreenStart() async{
    var duration = const Duration(seconds: 3);
    return Timer(duration, (){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Home()),

      );
    });
  }

  @override
  Widget build(BuildContext context){

    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            Icon(
              Icons.favorite,
              size: 100.0,
              color: Colors.yellowAccent,
            ),

            SizedBox(height: 24.0,),

            Text("KALKULATOR BMI",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
            ),
            ),
          ],
        ),
      ),
    );
  }

}
