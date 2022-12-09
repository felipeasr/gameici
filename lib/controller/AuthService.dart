import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../view/login/LoginPage.dart';
import 'ShowSnackBar.dart';
import 'UserVerification.dart';

class AuthException implements Exception {
  String message;
  AuthException(this.message);
}

class AuthService extends ChangeNotifier {
  final FirebaseAuth _auth;

  AuthService(this._auth);
  Future<void> signIn(String email, String password, context) async {
    try {
      await _auth
          .signInWithEmailAndPassword(
              email: email.trim(), password: password.trim())
          .then((value) => {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => const user_verification()),
                    (Route<dynamic> route) => false)
              });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ShowSnackBar(context, 'Usuário e/ou senha inválidos');
      } else if (e.code == 'wrong-password') {
        ShowSnackBar(context, 'Usuário e/ou senha inválidos');
      }
    }
  }

  Future<bool> singUp(
      String usertype, String email, String password, context) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password.trim());
      User? user = FirebaseAuth.instance.currentUser;
      await FirebaseFirestore.instance.collection("users").doc(user?.uid).set({
        'uid': user?.uid,
        'email': email,
        'role': usertype,
      });

      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        ShowSnackBar(context, 'Email já cadastrado');
      } else if (e.code == 'weak-password') {
        ShowSnackBar(context, 'senha fraca');
      }
      return false;
    }
  }

  Future<void> signOut(BuildContext context) async {
    try {
      await _auth.signOut().then((value) => {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => LoginPage()),
                (Route<dynamic> route) => false)
          });
    } on FirebaseAuthException catch (e) {
      ShowSnackBar(context, e.message!);
    }
  }

  String? getUid() {
    return _auth.currentUser?.uid;
  }

  Future<void> resetPassword(String email, context) async {
    try {
      await _auth.sendPasswordResetEmail(email: email.trim());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ShowSnackBar(context, 'Usuario não encontrado');
      }
    }
  }

  Future<void> veryemail(context) async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
    } catch (e) {
      ShowSnackBar(context, e.toString());
    }
  }
}
