import 'package:cloud_firestore/cloud_firestore.dart';

class SubServices {
  final String? id_user;
  final String? comment;
  final Timestamp? date;


  SubServices({
    this.id_user,
    this.comment,
    this.date,

  });

  factory SubServices.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return SubServices(
      id_user: data?['user_id'],
      comment: data?['comment'],
      date: data?['date'],

    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (id_user != null) "user_id": id_user,
      if (comment != null) "comment": comment,
      if (date != null) "date": date,

    };
  }
}