import 'package:cloud_firestore/cloud_firestore.dart';

class Comment {
  final String id;
  final String detail;
  final String publisherId;
  final Timestamp createTime;

  Comment({this.id, this.detail, this.publisherId, this.createTime});

  factory Comment.createDocument(DocumentSnapshot doc) {
    return Comment(
      id: doc.id,
      detail: doc.data()["icerik"],
      publisherId: doc.data()["publisherId"],
      createTime: doc.data()["createTime"],
    );
  }
}
