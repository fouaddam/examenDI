

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../FBItems/ProfilClass.dart';


class FBAdmine{

  FirebaseAuth firebaseAuth=FirebaseAuth.instance;
  FirebaseFirestore firebaseFireStore=FirebaseFirestore.instance;


  FBAdmine();


        bool CheckProfil(){
          return true;
        }

        bool CheckUser(){
          return true;
        }

        bool insertUser(){
          return true;
        }

        bool insertProfil(){
          return true;
        }

        ProfilClass getProfil(){

          return ProfilClass();
        }


        String? getCurrentUSer(){
          return firebaseAuth.currentUser?.uid;
        }




}