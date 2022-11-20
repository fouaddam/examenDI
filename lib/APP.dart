

import 'package:examendi/userManeger/Splash.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget{
  const App({super.key});

  String initialRoute() {
    if (FirebaseAuth.instance.currentUser == null) {
      return '/Login';
    } else {
      return '/CategoryListPage';
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return   MaterialApp(
      initialRoute: '/Splash',
      routes: {
        '/Splash':(context)=>Splash(duration: 5, Go_to: initialRoute())

      },



    );
  }






}