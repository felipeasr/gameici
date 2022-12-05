import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import '../../controller/AuthService.dart';
import '../../controller/ResponsiveScreen.dart';
import '../../controller/SizeConfig.dart';
import '../../controller/controllerBarHealth.dart';

class verifyEmailPage extends StatefulWidget {
  const verifyEmailPage({super.key});

  @override
  _verifyEmailPageState createState() => _verifyEmailPageState();
}

class _verifyEmailPageState extends State<verifyEmailPage> {
  final int _paginaAtual = 0;
  final int _selectedIndex = 0;
  bool isEmailVerified = false;
  Timer? timer;
  @override
  void initState() {
    super.initState();

    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;

    if (!isEmailVerified) {
      AuthService(FirebaseAuth.instance).veryemail(context);
      timer = Timer.periodic(
          const Duration(seconds: 3), (_) => checkemailverificaed());
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future checkemailverificaed() async {
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });
    if (isEmailVerified) {
      timer?.cancel();
    }
  }

  @override
  Widget build(BuildContext context) => isEmailVerified
      ? ControllerBarHealth(_paginaAtual, _selectedIndex)
      : Scaffold(
          appBar: !Responsive.isDesktop(context)
              ? AppBar(
                  elevation: 0,
                  title: const Text('Verifique seu e-mail'),
                )
              : const PreferredSize(
                  preferredSize: Size.zero,
                  child: SizedBox(),
                ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (!Responsive.isDesktop(context))
                  Expanded(
                    flex: 4,
                    child: SizedBox(
                      width: double.infinity,
                      height: SizeConfig.screenHeight,
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(
                            vertical: 250.0, horizontal: 30.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              "Verifique o seu email e clique no link que foi enviado a você.",
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                            const Text(
                              "Caso não tenha encontrado o email, verifique, também, a sua caixa de spam.",
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            ElevatedButton.icon(
                                onPressed: () {
                                  AuthService(FirebaseAuth.instance)
                                      .veryemail(context);
                                },
                                icon: const Icon(Icons.email),
                                label: const Text('Renviar email')),
                          ],
                        ),
                      ),
                    ),
                  ),
                if (Responsive.isDesktop(context))
                  Expanded(
                    flex: 4,
                    child: SizedBox(
                      width: double.infinity,
                      height: SizeConfig.screenHeight,
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(
                            vertical: 250.0, horizontal: 30.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              "Verifique o seu email e clique no link que foi enviado a você.",
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.justify,
                            ),
                            const Text(
                              "Caso não tenha encontrado o email, verifique, também, a sua caixa de spam.",
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.justify,
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            ElevatedButton.icon(
                                onPressed: () {
                                  AuthService(FirebaseAuth.instance)
                                      .veryemail(context);
                                },
                                icon: const Icon(Icons.email),
                                label: const Text('Renviar email')),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
}
