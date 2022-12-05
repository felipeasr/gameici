import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../view/admin/AdminCards.dart';
import '../view/education/VeryEmailEducacao.dart';
import '../view/health/VeryEmailHealth.dart';

class user_verification extends StatefulWidget {
  const user_verification({super.key});

  @override
  _user_verification createState() => _user_verification();
}

class _user_verification extends State<user_verification> {
  String role = '';

  @override
  void initState() {
    super.initState();
    _checkRole();
  }

  void _checkRole() async {
    User? user = FirebaseAuth.instance.currentUser;
    final DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(user?.uid)
        .get();

    setState(() {
      role = snap['role'];
    });

    if (role == 'Saude') {
      navigateNext(const verifyEmailPage());
    } else if (role == 'Educacao') {
      navigateNext(verifyEmailPageEducacao());
    } else {
      navigateNext(const AdminCard());
    }
  }

  void navigateNext(Widget route) {
    Timer(const Duration(milliseconds: 500), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => route));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircleAvatar(
              backgroundColor: Colors.yellow,
              backgroundImage: NetworkImage(
                'https://i0.wp.com/ici.ong/wp-content/uploads/2016/10/leao.png?ssl=1',
              ),
              radius: 120.0,
            ),
          ],
        ),
      ),
    );
  }
}
