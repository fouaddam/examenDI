

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../CustomView/RFTextInput.dart';


class Register extends StatelessWidget {


  final RFtextField inputEmail = RFtextField();
  final RFtextField inputPassword = RFtextField();
  final RFtextField inputPassword2 = RFtextField();

  Register({super.key});




  void insertUser(BuildContext context) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: inputEmail.getText_input(),
        password: inputPassword.getText_input(),
      );

      //la primera vez te deja entrar a Categorylist sin perfil
      //en el login2 verificamos si tiene perfil si lo tiene
      //entras a Ctegory list si no lo tiene le sugiremos al usuario completar el perfil
      Navigator.of(context).popAndPushNamed('/CategoryListPage');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Fluttertoast.showToast(
            msg: 'The password provided is too weak.',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );

      } else if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(
            msg: 'The account already exists for that email.',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );

      }
    } catch (e) {
      print(e);
    }
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        child: Stack(
          children: [

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


                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: inputEmail,
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: inputPassword,

                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: inputPassword2,
                  ),
                  SizedBox(height: 20),

                  Padding(
                    padding: const EdgeInsets.only(left: 80),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: FloatingActionButton.extended(
                            backgroundColor: Colors.white60,
                            foregroundColor: Colors.black,
                            onPressed: () {
                              //condicion de contraseña
                              if(inputPassword.getText_input()!=inputPassword2.getText_input()){
                                Fluttertoast.showToast(
                                    msg: 'the password does not match',
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0
                                );
                              }else{
                                insertUser(context);
                              }

                            },
                            icon: const Icon(Icons.account_circle_rounded),
                            label: const Text('registrar ',
                              style: TextStyle(
                                  fontSize: 20
                              ),),
                          ),
                        ),
                        FloatingActionButton.extended(
                          backgroundColor: Colors.white60,
                          foregroundColor: Colors.black,
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(Icons.account_circle_rounded),
                          label: const Text('Salir ',
                            style: TextStyle(
                                fontSize: 20
                            ),),
                        )


                      ],
                    ),
                  ),


                ],
              ),
            ),

          ],
        ),

      ),


    );
  }


}