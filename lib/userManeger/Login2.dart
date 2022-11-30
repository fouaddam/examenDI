



import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../CustomView/RFFloatButton.dart';
import '../CustomView/RFTextInput.dart';


class Login2 extends StatelessWidget{
  Login2({Key ? key}):super(key: key);

  RFtextField inputEmail=RFtextField(Label_text:"Email");
  RFtextField inputPassword=RFtextField(Label_text: "Password",bVisible: true,);

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

      body: Stack(

        children:  [

          Positioned.fill(child: Image.asset('assets/Login2.jpg',
            fit: BoxFit.cover,)),
          Center(

            child: Column(


              children: [
                const SizedBox(height: 70),
                ClipOval(
                  child: Container(
                      width: 120,
                      height: 120,
                      color: Colors.transparent,
                      child: const Icon(
                        Icons.account_box_outlined,
                        size: 50,
                        color: Colors.white,
                      )

                  ),
                ),
                const SizedBox(height: 70),
                Padding(
                  padding: const EdgeInsets.only(left: 60,right: 60),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,

                    children: <Widget>[
                      Container(
                        height: 40.0,
                        width: 40.0,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                'assets/Splash.jpg'),
                            fit: BoxFit.cover,
                          ),
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 30,),
                      Expanded(child: inputEmail),
                    ],
                  ),
                )
                ,
                const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 60,right: 60),
              child: Row(

                children: <Widget>[
                  Container(
                    height: 40.0,
                    width: 40.0,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/Splash.jpg'),
                        fit: BoxFit.cover,
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 30,),
                  Expanded(child: inputPassword),
                ],
              ),
            )
            ,
                const SizedBox(height: 70),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    Padding(

                      padding: const EdgeInsets.only(right: 30),
                      child: Container(
                        decoration:  const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/Splash.jpg"),
                              fit: BoxFit.cover),
                        ),

                        child: FloatingActionButton.extended(
                          backgroundColor: Colors.transparent,
                          foregroundColor: Colors.white,
                          onPressed: () {
                            singIn(context);
                          },
                          icon:  const Icon(Icons.account_circle),
                          label:  const Text("Login",
                            style: TextStyle(
                                fontSize: 35
                            ),
                          ),
                        ),
                      ),
                    ),
                      const RFFloatButton(sRuta: "/Login",sText: "Salir",iconData:Icons.power_settings_new)

                  //  Login
                  ],
                ),
                const SizedBox(height: 20,),

                TextButton(
                  onPressed: () {
                    Navigator.of(context).popAndPushNamed('/Register');
                  },
                  child:  const Text("Registrate ahora ",
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


    );
  }




}