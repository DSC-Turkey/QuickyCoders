import 'package:firebase_auth/firebase_auth.dart';
import 'package:preservingculturalheritage/Models/Users.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth auth;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  String activeUserId;
  AuthService({this.auth});
  Stream<User> get user => auth.authStateChanges();

  Users _userRegister(User user) {
    return user == null ? null : Users.productFromFirebase(user);
  }

  Stream<Users> get stateTracker {
    return _firebaseAuth.authStateChanges().map(_userRegister);
  }

  Future<Users> userRegisterWithMail(String email, String password) async {
    var registerCard = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    return _userRegister(registerCard.user);
  }

  Future<Users> userLoginWithMail(String email, String password) async {
    var loginCard = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return _userRegister(loginCard.user);
  }

  Future<void> logOut() {
    return _firebaseAuth.signOut();
  }

  Future<Users> loginWithGoogle() async {
    GoogleSignInAccount googleAccount = await GoogleSignIn().signIn();
    GoogleSignInAuthentication googleAuth = await googleAccount.authentication;
    AuthCredential loginWithoutPassword = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
      accessToken: googleAuth.accessToken,
    );
    UserCredential loginCard =
        await _firebaseAuth.signInWithCredential(loginWithoutPassword);
    return _userRegister(loginCard.user);
  }

  Future<void> resetPassword(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }
}
