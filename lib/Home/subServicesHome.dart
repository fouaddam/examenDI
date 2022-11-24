

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../CustomView/ListItem.dart';
import '../FBItems/SubServices.dart';
import '../singelton/DataHolder.dart';

class SubServicesHome extends StatefulWidget{
  const SubServicesHome({super.key});

  @override
  State<SubServicesHome> createState() => _SubServicesHomeState();
}


class _SubServicesHomeState extends State<SubServicesHome> {

  final String Path="/Services/"+DataHolder().serviceClass.Uid!+"/subServices";
  final FirebaseFirestore db=FirebaseFirestore.instance;

  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];

  List<QueryDocumentSnapshot<SubServices>> listSubService=[];


  void DescargarSubServives() async {
    final docRef = db.collection(Path).withConverter(
      fromFirestore: SubServices.fromFirestore,
      toFirestore: (SubServices chatText, _) => chatText.toFirestore(),
    );

    docRef.snapshots().listen(
          (event) =>
          setState(() {
            listSubService.clear();
            listSubService = event.docs;
          }
          ),
      onError: (error) =>
          print("Listen failed: $error"
          ),
    );
  }

  void onClick(int index){

  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      DescargarSubServives();
    });

  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body:Stack(
        children: [

      ListView.builder(
      padding: const EdgeInsets.all(8),
        itemCount: listSubService.length,
        itemBuilder: (BuildContext context, int index) {
          return ListItem(name:listSubService[index].data().comment!,onClick:onClick,index:index);
          //ListItem({super.key, required this.name, required this.onClick, required this.index});
        }
    ),
          const SizedBox(height: 10,),



        ],
      )



    );

  }
}