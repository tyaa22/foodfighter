import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  //get current user
  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }

  //log in
  Future<UserCredential> login(String email, password) async {
    try {
      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      return userCredential;
    }
    on FirebaseAuthException catch (e) {
      throw(e.code);
    }
  }

//register
  Future<UserCredential> register(String email, password) async {
    try {
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      return userCredential;
    }
    on FirebaseAuthException catch (e) {
      throw(e.code);
    }
  }

//log out
Future<void> logout() async {
    return await _firebaseAuth.signOut();
}

}