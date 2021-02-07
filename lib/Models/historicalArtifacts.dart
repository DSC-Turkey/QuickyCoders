import 'package:cloud_firestore/cloud_firestore.dart';

class HistoricalArtifacts {
  final String id;
  final String photoUrl;
  final String userId;
  final String description;
  final String type;
  final String location;
  final Timestamp createTime;

  HistoricalArtifacts(
      {this.id,
      this.userId,
      this.photoUrl,
      this.description,
      this.type,
      this.location,
      this.createTime});

  factory HistoricalArtifacts.createDocument(DocumentSnapshot doc) {
    return HistoricalArtifacts(
      id: doc.id,
      userId: doc.data()["userId"],
      photoUrl: doc.data()["postImageUrl"],
      description: doc.data()["description"],
      type: doc.data()["type"],
      location: doc.data()["location"],
      createTime: doc.data()["createDate"],
    );
  }
}
