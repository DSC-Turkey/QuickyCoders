import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:preservingculturalheritage/Models/Users.dart';
import 'package:preservingculturalheritage/Models/historicalArtifacts.dart';

class FirebaseHistArtServices {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createPost(
      {postimageUrl, description, userId, type, location}) async {
    await _firestore.collection("posts").add({
      "postImageUrl": postimageUrl,
      "description": description,
      "userId": userId,
      "type": type,
      "location": location,
      "createDate": DateTime.now(),
    });
  }

  Future<List<HistoricalArtifacts>> getHistoricalArtifacts() async {
    QuerySnapshot snapshot = await _firestore
        .collection("posts")
        .orderBy("createDate", descending: true)
        .get();
    List<HistoricalArtifacts> response = snapshot.docs
        .map((doc) => HistoricalArtifacts.createDocument(doc))
        .toList();
    return response;
  }

  Future<List<HistoricalArtifacts>> getHistoricalArtifactsbyType(type) async {
    QuerySnapshot snapshot = await _firestore
        .collection("posts")
        .where("type", isEqualTo: type)
        .orderBy("createDate", descending: true)
        .get();
    List<HistoricalArtifacts> response = snapshot.docs
        .map((doc) => HistoricalArtifacts.createDocument(doc))
        .toList();
    return response;
  }

  Future<List<HistoricalArtifacts>> getHistoricalArtifactsbyUser(userId) async {
    QuerySnapshot snapshot = await _firestore
        .collection("posts")
        .where("userId", isEqualTo: userId)
        .orderBy("createDate", descending: true)
        .get();
    List<HistoricalArtifacts> response = snapshot.docs
        .map((doc) => HistoricalArtifacts.createDocument(doc))
        .toList();
    return response;
  }

  Future<Users> getUsers(id) async {
    DocumentSnapshot doc = await _firestore.collection("users").doc(id).get();
    if (doc.exists) {
      Users users = Users.createDocument(doc);
      return users;
    }
    return null;
  }
}
