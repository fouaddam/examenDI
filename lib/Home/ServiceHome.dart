



import 'package:flutter/material.dart';


import '../singelton/DataHolder.dart';

class ServiceHome1 extends StatefulWidget{


  @override
  State<ServiceHome1> createState() => _ServiceHome1State();
}

class _ServiceHome1State extends State<ServiceHome1> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text(DataHolder().serviceClass.name!),
        ),
        body:Column(
          children: [

          ],
        )
    );
  }
}