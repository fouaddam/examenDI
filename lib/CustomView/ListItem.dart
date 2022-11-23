import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListItem extends StatelessWidget{

  final  String name;
  final Function(int index) onClick;
  final int index;

  const ListItem({super.key, required this.name, required this.onClick, required this.index});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  ListTile(

      title: Text(name,style:
      const TextStyle(fontWeight: FontWeight.bold,height: 3
        , fontSize: 18,  color: Colors.pink,
        decoration: TextDecoration.overline,
        decorationColor: Colors.teal,
        decorationStyle: TextDecorationStyle.double,)),
      leading: const Icon(Icons.ad_units),
      onTap: (){
        onClick(index);
      },
    );
  }

}