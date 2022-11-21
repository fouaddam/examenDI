

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RFButton extends StatelessWidget{
  final String textButton;
  final String pathImage;
  final Function(int index) onShortClick;


  const RFButton({super.key, required this.textButton, required this.pathImage, required this.onShortClick});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return OutlinedButton.icon(
      onPressed: () {
        onShortClick;
      },
      icon: Image.asset(pathImage),
      label: Text(textButton,
          style: TextStyle(
          color: Colors.grey[800],
          fontWeight: FontWeight.bold,
          fontSize: 40)
      )
    );
  }




}