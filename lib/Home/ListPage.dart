

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:proyectofinal/src/models/Service.dart';
import 'package:proyectofinal/src/models/UsersProfilsClass.dart';
import 'package:proyectofinal/src/singelton/DataHolder.dart';

import '../singelton/DataHolder.dart';

class CategoryListPage extends StatefulWidget{
  @override
  State<CategoryListPage> createState() => _CategoryListPageState();
}

class _CategoryListPageState extends State<CategoryListPage> {



  final List<String> imageName = <String>['comida1', 'comida2', 'comida3','comida4','comida5'];
  final String? idUsder=FirebaseAuth.instance.currentUser?.uid;
  final FirebaseFirestore firebaseFirestore=FirebaseFirestore.instance;
  List<QueryDocumentSnapshot<ServiceClass>>listaServicios=[];


  void getServices() async {

    final ref =firebaseFirestore.collection("/Services").withConverter(
      fromFirestore: ServiceClass.fromFirestore,
      toFirestore: (ServiceClass serviceClass, _) => serviceClass.toFirestore(),
    );
    final docSnap = await ref.get();

    setState(() {
      listaServicios=docSnap.docs;
    });


  }



  void showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(' Perfil  incompleto '
            ,style: TextStyle(
                color: Colors.orangeAccent
            ),),
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),


          content:
          SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('si desaes completar tu perfil .',style: TextStyle(
                    color: Colors.white
                ),),
                Text('     presiona aceptar ',style: TextStyle(
                    color: Colors.white
                ),),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Aceptar',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 12
                ),),
              onPressed: () {

                Navigator.of(context).popAndPushNamed('/onBoarding');
              },
            ),
            TextButton(
              child: const Text('Cancelar',style: TextStyle(
                  color: Colors.black,
                  fontSize: 12
              ),),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }


  void CheckPerfilCurrentUser()async{

    final ref = firebaseFirestore.collection('/Profils').doc(idUsder).withConverter(
      fromFirestore: ProfilClass.fromFirestore,
      toFirestore: (ProfilClass userClass, _) => userClass.toFirestore(),
    );
    final docSnap = await ref.get();
    final userClass = docSnap.data(); // Convert to City object
    if (userClass != null) {

      DataHolder().profilClass=userClass;
      Fluttertoast.showToast(
          msg:'Welcom '+userClass.name.toString()+" :)",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 35.0

      );
    } else {
      showMyDialog();
    }

  }



  @override
  void initState() {
    super.initState();
    CheckPerfilCurrentUser();
    getServices();
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      drawer: Drawer(

        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Wrap(
              runSpacing: 16,
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                      color: Colors.black12
                  ),
                  child: Stack(
                    children: const [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: CircleAvatar(
                          radius: 40,
                          backgroundImage:
                          AssetImage('assets/Fouad.jpg'),
                          backgroundColor: Colors.transparent,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(25.0),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text("Assouik Fouad",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              shadows: <Shadow>[
                                Shadow(
                                  offset: Offset(10.0, 5.0),
                                  blurRadius: 2.0,
                                  color: Color.fromARGB(50, 0, 0, 0),
                                ),
                                Shadow(
                                  offset: Offset(10.0, 10.0),
                                  blurRadius: 3.0,
                                  color: Color.fromARGB(50, 0, 0, 50),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],




                  ),

                ),


                SizedBox(height: 40,),
                ListTile(
                  leading: const Icon(Icons.home_outlined),
                  title: Text("Sing out"),
                  onTap: (){
                    FirebaseAuth.instance.signOut();
                    Navigator.of(context).popAndPushNamed('/Login2');
                  },
                ),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text("Back"),
                  onTap: (){
                    Navigator.of(context).popAndPushNamed('/CategoryListPage');
                  },
                ),

                ListTile(
                  leading: Icon(Icons.home),
                  title: Text("Back"),
                  onTap: (){
                    Navigator.of(context).popAndPushNamed('/CategoryListPage');
                  },
                ),

                ListTile(
                  leading: Icon(Icons.home),
                  title: Text("Back"),
                  onTap: (){

                    Navigator.of(context).popAndPushNamed('/CategoryListPage');
                  },
                ),

                ListTile(
                  leading: Icon(Icons.home),
                  title: Text("Back"),
                  onTap: (){

                    Navigator.of(context).popAndPushNamed('/CategoryListPage');
                  },
                )

              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.deepOrange),
        actions: [
          Container(

            margin: EdgeInsets.only(right: 8),
            padding: EdgeInsets.all(10),
            child: ClipOval(

              child: Image.asset('assets/comida3.jpg'
                ,fit: BoxFit.cover,),
            ),
          )
        ],

      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children:  [
            Padding(
              padding: EdgeInsets.only(top: 30,bottom: 10),

              child: Text("Selecione una Categoria ",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(10.0, 5.0),
                      blurRadius: 2.0,
                      color: Color.fromARGB(50, 0, 0, 0),
                    ),
                    Shadow(
                      offset: Offset(10.0, 10.0),
                      blurRadius: 3.0,
                      color: Color.fromARGB(50, 0, 0, 50),
                    ),
                  ],

                ),
              ),

            ),
            Expanded(

              child:
              ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: listaServicios.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.all(30),
                      height: 150,
                      child:Stack(

                        children: [
                          Positioned.fill(
                            child:ClipRRect(
                              borderRadius:BorderRadius.circular(30),
                              child:Image.asset('assets/'+imageName[index]+'.jpg',fit:BoxFit.cover,),
                            ),
                          ),
                          GestureDetector(
                            onTap:()  {

                              DataHolder().serviceClass=listaServicios[index].data();
                              Navigator.of(context).pushNamed('/ServiceHome1');
                            },
                          ),

                          Positioned(
                            bottom: 0,

                            child: Row(
                              children:  [

                                Padding(
                                  padding: const EdgeInsets.only(left: 180),
                                  child: Text(listaServicios[index].data().name!,

                                    style: TextStyle(
                                        color:Colors.deepOrange,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold
                                    ),),
                                ),

                              ],

                            ),)



                        ],
                      ),
                      //: Center(child: Text('Entry ${entries[index]}')),
                    );
                  }
              ),)


          ],
        ),
      ),

    );
  }
}



