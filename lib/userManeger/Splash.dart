
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:percent_indicator/percent_indicator.dart';

import '../CustomView/AnimationTxt.dart';

class Splash extends StatelessWidget{
  final int duration;
  final  String Go_to;
  Splash({Key? key, required this.duration, required this.Go_to}):super(key:key);


  @override
  Widget build(BuildContext context) {

    Future.delayed(Duration(seconds:this.duration), (){
      Navigator.of(context).popAndPushNamed(this.Go_to);

    });
    // TODO: implement build
    return Scaffold(
        backgroundColor:Colors.white24,
        body:Center(

          child:  CircularPercentIndicator(
            radius: 120.0,
            lineWidth:30.0 ,
            percent: 100/100,
            animation: true,
            animationDuration: 3000,
            backgroundColor: Colors.purple,

            center: const AnimationTxt(text1:"Examen",text2: "D.I"),

            progressColor: Colors.orange,
          ),


        )

    );



  }


}