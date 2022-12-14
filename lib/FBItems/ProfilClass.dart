import 'package:cloud_firestore/cloud_firestore.dart';

class ProfilClass {
  final String? id;
  final String? name;
  final int? age;
  final String? country;



  ProfilClass({
    this.id,
    this.name,
    this.age,
    this.country,


  });

  factory ProfilClass.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return ProfilClass(
      id: snapshot.id,
      name: data?['name'],
      age: data?['age'],
      country: data?['country'],


    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,
      if (age != null) "state": age,
      if (country != null) "country": country,
    };
  }
}