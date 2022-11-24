import 'package:cloud_firestore/cloud_firestore.dart';

class SubServices {
  final String? author;
  final String? comment;
  final Timestamp? time;


  SubServices({
    this.author,
    this.comment,
    this.time,

  });

  factory SubServices.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return SubServices(
      author: data?['author'],
      comment: data?['text'],
      time: data?['time'],

    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (author != null) "author": author,
      if (comment != null) "text": comment,
      if (time != null) "time": time,

    };
  }
}