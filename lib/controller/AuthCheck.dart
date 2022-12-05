import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gameici/controller/UserVerification.dart';

import '../view/login/LoginPage.dart';


class AuthCheck extends StatelessWidget {
  const AuthCheck({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return const user_verification();
          } else {
            return LoginPage();
          }
        }),
      ),
    );
  }
}
