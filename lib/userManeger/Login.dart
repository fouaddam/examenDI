

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';


class Login extends StatelessWidget{
  Login({Key ? key}):super(key: key);




  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      body: Container(

        color: Colors.black12,
        child: Stack(

          children:  [

            Positioned.fill(child: Image.asset('assets/LoginImage.jpg',
              fit: BoxFit.cover,)),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 10,),
                  ClipOval(
                    child: Container(
                        width: 180,
                        height: 180,
                        color: Colors.transparent,
                        child: const Icon(
                          Icons.ad_units,
                          size: 100,
                          color: Colors.white,
                        )

                    ),
                  ),
                  SizedBox(height: 30,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                    AnimatedTextKit(
                      animatedTexts: [
                        WavyAnimatedText('bienvenido ',
                            textStyle: const TextStyle(
                              color: Colors.blue,
                              fontSize: 30,
                            )),
                      ],
                      repeatForever: true,
                    ),
                  ),
                  SizedBox(height: 10),



                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      FloatingActionButton.extended(
                        backgroundColor:Colors.transparent,
                        foregroundColor: Colors.white,
                        onPressed: () {
                          Navigator.of(context).pushNamed('/Login2');

                        },
                        icon: const Icon(Icons.account_circle_rounded),
                        label: const Text('Login ',
                          style: TextStyle(
                              fontSize: 30
                          ),),
                      ),
                      FloatingActionButton.extended(
                        backgroundColor:Colors.transparent,
                        foregroundColor: Colors.white,
                        onPressed: () {
                          Navigator.of(context).pop();

                        },
                        icon: const Icon(Icons.account_circle_rounded),
                        label: const Text('Salir ',
                          style: TextStyle(
                              fontSize: 30
                          ),),
                      )
                      ,

                    ],
                  ),
                  SizedBox(height: 30,),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).popAndPushNamed('/Register');
                    },
                    child: const Text("Registrate ahora "
                      ,style: TextStyle(
                          color: Colors.purple,
                          fontSize: 20
                      ),),
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