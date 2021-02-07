import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:preservingculturalheritage/Models/historicalArtifacts.dart';

class FirebaseCommentService {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot> getComments(String postId) {
    return _firestore
        .collection("comments")
        .doc(postId)
        .collection("postComments")
        .orderBy("createTime", descending: true)
        .snapshots();
  }

  void addComment(
      {String activeUserId, HistoricalArtifacts post, String detail}) {
    _firestore
        .collection("comments")
        .doc(post.id)
        .collection("postComments")
        .add({
      "detail": detail,
      "publisherId": activeUserId,
      "createTime": DateTime.now(),
    });
  }
}
