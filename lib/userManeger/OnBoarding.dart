

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../CustomView/RFTextInput.dart';
import '../FBItems/ProfilClass.dart';


class onBoarding extends StatelessWidget {


  final RFtextField name = RFtextField();
  final RFtextField edad = RFtextField();
  final RFtextField pais = RFtextField();


  final String? id_user=FirebaseAuth.instance.currentUser?.uid;
  final FirebaseFirestore db=FirebaseFirestore.instance;


  void insertData(BuildContext context) async {
    final usuario = ProfilClass(
      name: name.getText_input(),
      age: int.parse(edad.getText_input()),
      country: pais.getText_input(),

    );
    final docRef = db
        .collection("/Profils")
        .withConverter(
      fromFirestore: ProfilClass.fromFirestore,
      toFirestore: (ProfilClass usuario, options) => usuario.toFirestore(),
    )
        .doc(id_user);
    await docRef.set(usuario);
    Navigator.of(context).popAndPushNamed('/onBoarding');

  }




  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(


      body: Container(

        color: Colors.black12,
        child: Stack(

          children: [

            Positioned.fill(child: Image.asset('assets/Login2.jpg',
              fit: BoxFit.cover,)),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipOval(
                    child: Container(
                        height: 140,
                        width: 140,
                        color: Colors.white54,
                        child: const Icon(
                          Icons.ad_units,
                          size: 60,
                        )

                    ),
                  ),
                  const SizedBox(height: 10,),

                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: name,
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: pais,
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: edad,
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8,left: 20),
                          child: FloatingActionButton.extended(
                            backgroundColor: Colors.white60,
                            foregroundColor: Colors.black,
                            onPressed: () {
                              insertData(context);

                            },
                            icon: const Icon(Icons.account_circle_rounded),
                            label: const Text('    Register    ',
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
                          icon: Icon(Icons.account_circle_rounded),
                          label: Text('Salir ',
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