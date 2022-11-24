import 'package:cloud_firestore/cloud_firestore.dart';

class ServiceClass {
  final String? Uid;
  final String? name;


  ServiceClass( {
    this.Uid,
    this.name,

  });

  factory ServiceClass.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return ServiceClass(
      name: data?['name'],
        Uid: snapshot.id
    );

  }

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,

    };
  }
}