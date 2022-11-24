

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../CustomView/ListItem.dart';
import '../CustomView/RFTextInput.dart';
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
  final RFtextField comentario=RFtextField(Label_text:"Comentario");




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
          SizedBox(height: 10,),


          comentario,
          FloatingActionButton.extended(
            onPressed: PressedPressed,
            label: const Text('Send'),
            icon: const Icon(Icons.thumb_up),
            backgroundColor: Colors.pink,
          ),




        ],
      )



    );

  }
}