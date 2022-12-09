import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';
import '../../../controller/auth_service.dart';
import '../ResetPasswordPage.dart';
import '../SingUpPage.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _LoginWidget createState() => _LoginWidget();
}

class _LoginWidget extends State<LoginWidget> {
  final TextEditingController _mailInputController = TextEditingController();
  final TextEditingController _passwordInputController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Container(
        decoration: const BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0))),
        child: SizedBox(
          //color: Colors.yellow[600],
          child: Padding(
            padding: const EdgeInsets.only(top: 30.0, right: 20.0, left: 20.0),
            child: Align(
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  const CircleAvatar(
                    backgroundColor: Colors.yellow,
                    backgroundImage: NetworkImage(
                      'https://i0.wp.com/ici.ong/wp-content/uploads/2016/10/leao.png?ssl=1',
                    ),
                    radius: 120.0,
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              // autofocus: true
              validator: Validatorless.multiple([
                Validatorless.required("Por favor, preencha o campo de email"),
                Validatorless.email("Por favor, preencha com email valido")
              ]),
              controller: _mailInputController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                icon: Icon(Icons.email),
                labelText: "E-mail",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              // autofocus: true,
              validator: Validatorless.multiple([
                Validatorless.required("Por favor, preencha o campo de senha"),
              ]),
              controller: _passwordInputController,
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: const InputDecoration(
                icon: Icon(Icons.password),
                labelText: "Senha",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
      Container(
        height: 40,
        alignment: Alignment.centerRight,
        child: TextButton(
          style: TextButton.styleFrom(foregroundColor: Colors.black),
          child: const Text(
            "Esqueceu a senha? Clique aqui",
            textAlign: TextAlign.right,
            style: TextStyle(decoration: TextDecoration.underline),
          ),
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => ResetPassword())),
        ),
      ),
      const SizedBox(
        height: 5,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.red,
              backgroundColor: Colors.white, // foreground
            ),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _doLogin(context);
              }
            },
            child: const Text("Login"),
          ),
          const SizedBox(
            width: 20.0,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.yellow,
              backgroundColor: Colors.red, // foreground
            ),
            child: const Text("Cadastre-se"),
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => const SingUp())),
          ),
        ],
      ),
    ]);
  }

  void _doLogin(context) {
    AuthService(FirebaseAuth.instance).signIn(
        _mailInputController.text, _passwordInputController.text, context);
  }
}
