



import 'package:flutter/material.dart';


import '../CustomView/RFButton.dart';
import '../singelton/DataHolder.dart';

class ServiceHome1 extends StatefulWidget{


  @override
  State<ServiceHome1> createState() => _ServiceHome1State();
}



class _ServiceHome1State extends State<ServiceHome1> {


  @override
  Widget build(BuildContext context) {


    String func(int index){
      String sPath="";
      switch(index){
        case 1:sPath="/CategoryListPage";break;
      }
      return sPath;
    }
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text(DataHolder().serviceClass.name!),
        ),
        body:Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RFButton(textButton: "hola",pathImage:'assets/Splash.jpg',nav: func(1))
              ],
            )


          ],
        )
    );
  }
}