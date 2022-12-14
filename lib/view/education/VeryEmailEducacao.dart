import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../controller/ResponsiveScreen.dart';
import '../../controller/SizeConfig.dart';
import '../../controller/auth_service.dart';
import '../../controller/controllerBarEducation.dart';

class verifyEmailPageEducacao extends StatefulWidget {
  @override
  _verifyEmailEducacaoPageState createState() =>
      _verifyEmailEducacaoPageState();
}

class _verifyEmailEducacaoPageState extends State<verifyEmailPageEducacao> {
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
      ? ControllerBarEducation(_paginaAtual, _selectedIndex)
      : Scaffold(
          //backgroundColor: C,
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
                    child: Container(
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
                              "Verifique o seu email e clique no link que foi enviado a voc??.",
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                            const Text(
                              "Caso n??o tenha encontrado o email, verifique, tamb??m, a sua caixa de spam.",
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
                    child: Container(
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
                              "Verifique o seu email e clique no link que foi enviado a voc??.",
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.justify,
                            ),
                            const Text(
                              "Caso n??o tenha encontrado o email, verifique, tamb??m, a sua caixa de spam.",
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
