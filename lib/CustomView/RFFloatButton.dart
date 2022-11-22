
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RFFloatButton extends StatelessWidget{

  //Icons.power_settings_new

  final String sText;
  final String sRuta;
  final IconData iconData;

  const RFFloatButton({super.key, required this.sRuta, required this.sText, required this.iconData});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/Splash.jpg"),
            fit: BoxFit.cover),
      ),
      child: FloatingActionButton.extended(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        onPressed: () {

          Navigator.of(context).popAndPushNamed(sRuta);
        },
        icon:  Icon(iconData),
        label:  Text(sText,
          style: const TextStyle(
              fontSize: 35
          ),
        ),
      ),
    );
  }




}