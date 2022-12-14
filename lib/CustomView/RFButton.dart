

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RFButton extends StatelessWidget{
  final String textButton;
  final String pathImage;

  final String nav;

   const RFButton({super.key, required this.textButton, required this.pathImage, required this.nav});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  MaterialButton(
      padding: EdgeInsets.all(8.0),
      textColor: Colors.white,
      splashColor: Colors.greenAccent,
      elevation: 8.0,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(pathImage),
              fit: BoxFit.cover),
        ),
        child:  Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(textButton),
        ),
      ),
      // ),
      onPressed: () {
        FirebaseAuth.instance.signOut();
      },
    );
  }




}