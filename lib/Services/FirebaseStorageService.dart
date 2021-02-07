import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

class FirebaseStorageService {
  Reference _storage = FirebaseStorage.instance.ref();
  String imageid;

  Future<String> postImageUpload(File imageFile) async {
    imageid = Uuid().v4();
    UploadTask uploadManager =
        _storage.child("images/posts/post_$imageid.jpg").putFile(imageFile);
    TaskSnapshot snapshot = await uploadManager;
    String uploadedImageUrl = await snapshot.ref.getDownloadURL();
    return uploadedImageUrl;
  }
}
