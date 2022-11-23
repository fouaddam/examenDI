

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

            Positioned.fill(child: Image.asset('assets/Login2.jpg',
              fit: BoxFit.fill,)),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipOval(
                    child: Container(
                        width: 180,
                        height: 180,
                        color: Colors.transparent,
                        child: Image.asset("assets/England.png"
                        ,fit: BoxFit.fill,),

                    ),
                  ),
                  const SizedBox(height: 30,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                    AnimatedTextKit(
                      animatedTexts: [
                        WavyAnimatedText('English App ',
                            textStyle: const TextStyle(
                              color: Colors.red,

                              fontSize: 60,
                            )),
                      ],
                      repeatForever: true,
                    ),
                  ),
                  SizedBox(height: 10),



                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: FloatingActionButton.extended(
                          backgroundColor:Colors.black,
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
                      ),
                      FloatingActionButton.extended(
                        backgroundColor:Colors.black,
                        foregroundColor: Colors.white,
                        onPressed: () {
                          Navigator.of(context).pop();

                        },
                        icon: const Icon(Icons.account_circle_rounded),
                        label: const Text('Exit ',
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
                    child: const Text("Register Now "
                      ,style: TextStyle(
                          color: Colors.black,
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