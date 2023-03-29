
import 'package:flutter/material.dart';

class RFtextField extends StatelessWidget{

        final TextEditingController textEditingController=TextEditingController();
        final String Label_text;
        final String pathImage;
        final bool bVisible;

         RFtextField({super.key,this.Label_text="", this.pathImage="assets/LoginImage.jpg", this.bVisible=false, });


          String getText_input(){
            return textEditingController.text;
          }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  TextFormField(
          controller: textEditingController,
          cursorColor: Colors.white,
          obscureText: bVisible,

          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,

          ),
      decoration: InputDecoration(

          //icon: Image.asset(pathImage),
          labelText: Label_text,
          labelStyle: const TextStyle(
              color:Colors.purple,
              fontSize: 20

          ),

        //suffixIcon:  Image.asset(pathImage,scale: 10,)


      ),
    );
  }

}