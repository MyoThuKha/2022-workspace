import 'package:brew_crew/Models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //get custom user id from firebaseauth data.
  UserModel _getUId(User? user) {
    return user != null ? UserModel(uid: user.uid) : null!;
  }

  Stream<UserModel> get userStream {
    return _auth.authStateChanges().map(_getUId);
  }

  //Sign in as Anonymous
  Future signAsAnys() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user!;
      return _getUId(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Sign in with email
  Future logIn(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return _getUId(result.user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Register
  Future createAccount(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return _getUId(result.user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Signout
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
