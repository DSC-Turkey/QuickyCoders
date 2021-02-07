import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final nowTime = DateTime.now();

  Future<void> registerUser(
      {id,
      email,
      userName,
      fotoUrl =
          "https://png.pngitem.com/pimgs/s/150-1503945_transparent-user-png-default-user-image-png-png.png"}) async {
    await _firestore.collection("users").doc(id).set({
      "userName": userName,
      "email": email,
      "fotoUrl": fotoUrl,
      "hakkinda": "",
      "olusturulmaZamani": nowTime,
    });
  }
}
