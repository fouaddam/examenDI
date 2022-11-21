
import 'package:flutter/material.dart';

class RFtextField extends StatelessWidget{

        final TextEditingController textEditingController=TextEditingController();
        final String Label_text;
        final String pathImage;
         RFtextField({super.key,this.Label_text="", this.pathImage=""});


          String getText_input(){
            return textEditingController.text;
          }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  TextFormField(
          controller: textEditingController,
          cursorColor: Colors.white,
          maxLength: 20,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,

          ),
      decoration: InputDecoration(
          icon: const Icon(Icons.favorite),
          labelText: Label_text,
          labelStyle: const TextStyle(
              color:Colors.purple,
              fontSize: 20

          ),
        helperText: Label_text,
        suffixIcon: Image.asset(pathImage),


      ),
    );
  }

}