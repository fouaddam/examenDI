



import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../CustomView/RFTextInput.dart';


class Login2 extends StatelessWidget{
  Login2({Key ? key}):super(key: key);

  RFtextField inputEmail=RFtextField(Label_text:"Email");
  RFtextField inputPassword=RFtextField(Label_text: "Password",);

  singIn(BuildContext context) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: inputEmail.getText_input(),
        password: inputPassword.getText_input(),
      );
      //mas adelante hay que verificar si el usuario tiene perfil o no
      Navigator.of(context).popAndPushNamed('/CategoryListPage');

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Fluttertoast.showToast(
            msg: 'No user found for that email.',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );


      } else if (e.code == 'wrong-password') {
        Fluttertoast.showToast(
            msg: 'No user found for that email.',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );


      }
    }
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(


      body: Container(
        child: Stack(

          children:  [

            Positioned.fill(child: Image.asset('assets/LoginImage.jpg',
              fit: BoxFit.cover,)),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipOval(
                    child: Container(
                        height: 100,
                        width: 100,
                        color: Colors.purple,
                        alignment: Alignment.center,
                        child: const Icon(
                          Icons.lock,
                          size: 60,
                          color: Colors.white,
                          shadows: <Shadow>[
                            Shadow(
                              offset: Offset(10.0, 10.0),
                              blurRadius: 4.0,
                              color: Color.fromARGB(100, 10, 10, 10),
                            ),
                          ],
                        )

                    ),
                  ),
                  SizedBox(height: 60,),

                  Padding(
                    padding: const EdgeInsets.only(left: 50,right: 70),
                    child: inputEmail,
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 50,right: 70),
                    child: inputPassword,
                  ),
                  SizedBox(height: 30),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton.extended(
                        backgroundColor:Colors.transparent,
                        foregroundColor: Colors.white,
                        onPressed: () {
                          singIn(context);
                        },
                        icon: Icon(Icons.person_search),
                        label: Text('Login ',
                          style: TextStyle(
                              fontSize: 30
                          ),),
                      ),
                      FloatingActionButton.extended(
                        backgroundColor: Colors.transparent,
                        foregroundColor: Colors.white,
                        onPressed: () {

                          Navigator.of(context).popAndPushNamed("/Login");
                        },
                        icon: Icon(Icons.power_settings_new),
                        label: Text('Salir ',
                          style: TextStyle(
                              fontSize: 30
                          ),),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20,),

                  TextButton(
                    onPressed: () {
                      Navigator.of(context).popAndPushNamed('/Register');
                    },
                    child:  Text("Registrate ahora ",
                      style: TextStyle(
                          color:Colors.purple,
                          fontSize: 20

                      ),
                    ),
                  )


                ],
              ),
            ),

          ],
        ),

      ),


    );
  }




}