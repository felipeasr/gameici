import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';
import '../../../controller/AuthService.dart';
import '../../../controller/UserVerification.dart';
import '../LoginPage.dart';

class SingUnpWidget extends StatefulWidget {
  const SingUnpWidget({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _SingUnpWidget createState() => _SingUnpWidget();
}

class _SingUnpWidget extends State<SingUnpWidget> {
  String uid = " ";
  String? _usertype;
  final TextEditingController _mailInputController = TextEditingController();
  final TextEditingController _passwordInputController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: const BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0))),
          child: SizedBox(
            //color: Colors.yellow[600],
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 30.0, right: 20.0, left: 20.0),
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
                        "Cadastra-se",
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
                // autofocus: true,
                validator: Validatorless.multiple([
                  Validatorless.required(
                      "Por favor, preencha o campo de email"),
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
                  Validatorless.required(
                      "Por favor, preencha o campo de senha"),
                  Validatorless.min(6, "E obrigatorio no minimo 6 caracteres "),
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
        const SizedBox(
          height: 25,
        ),
        DropDownFormField(
          titleText: 'Profissional',
          hintText: 'Porfavor selecione o Profissional que voce é',
          value: _usertype,
          onSaved: (value) {
            setState(() {
              _usertype = value;
            });
          },
          onChanged: (value) {
            setState(() {
              _usertype = value;
            });
          },
          dataSource: const [
            {
              "display": "Saúde",
              "value": "Saude",
            },
            {
              "display": "Educação",
              "value": "Educacao",
            },
          ],
          textField: 'display',
          valueField: 'value',
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.yellow,
                backgroundColor: Colors.red, // foreground
              ),
              child: const Text("Cadastrar"),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _doSignUp(context);
                }
              },
            ),
            const SizedBox(
              width: 20.0,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.red,
                backgroundColor: Colors.white, // foreground
              ),
              child: const Text("Cancelar"),
              onPressed: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => LoginPage())),
            ),
          ],
        ),
      ],
    );
  }

  void _doSignUp(context) {
    AuthService(FirebaseAuth.instance)
        .singUp(_usertype!, _mailInputController.text,
            _passwordInputController.text, context)
        .then((value) => {
              if (value)
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => const user_verification()),
                    (Route<dynamic> route) => false)
            });
  }
}
