



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../FBAdmine/FBAdmine.dart';
import '../FBItems/ProfilClass.dart';
import '../FBItems/Service.dart';


class DataHolder{

      static final DataHolder _dataholder=new DataHolder._internal();
      ServiceClass serviceClass= ServiceClass();
      ProfilClass profilClass= ProfilClass();
      FBAdmine fbAdmine= FBAdmine();
      FirebaseAuth firebaseAuth=FirebaseAuth.instance;
      FirebaseFirestore firebaseFireStore=FirebaseFirestore.instance;
      String PROFILCOLLECTION="";
      String PROFILSERVICES="";


      String? getUidCurrentUser(){
          return fbAdmine.getCurrentUSer();
      }





      factory DataHolder(){
        return _dataholder;
      }

  DataHolder._internal();









}