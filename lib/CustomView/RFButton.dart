

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RFButton extends StatelessWidget{
  final String textButton;

  const RFButton({super.key, required this.textButton});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return OutlinedButton.icon(
      onPressed: () {
        // Respond to button press
      },
      icon: Icon(Icons.add, size: 18),
      label: Text(textButton),
    );
  }




}