import 'package:crypto_app/auth/sign_in_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  static final _auth = FirebaseAuth.instance;

  static bool isLoggedIn() {
    final User? firebaseUser = _auth.currentUser;
    return firebaseUser != null;
  }

  static Future<User?> signInUser(String email, String password) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
    final User firebaseUser = _auth.currentUser!;
    return firebaseUser;
  }

  static Future<User?> signUpUser(
      String name, String email, String password) async {
    var authResult = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    User? user = authResult.user;

    return user;
  }

  static void signOutUser(BuildContext context) {
    _auth.signOut();
    Navigator.pushReplacementNamed(context, SignInPage.id);
  }
}
