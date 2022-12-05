import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gameici/view/login/widgets/login_widgets.dart';

import '../../controller/ResponsiveScreen.dart';
import '../../controller/SizeConfig.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<bool?> showconfirmationDialog() {
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Sair da Aplicação ?"),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context, false),
                    child: const Text("cancelar")),
                TextButton(
                    onPressed: () => Navigator.pop(context, true),
                    child: const Text("sair"))
              ],
            );
          });
    }

    GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
    SizeConfig().init(context);
    return WillPopScope(
      onWillPop: () async {
        final confirmation = await showconfirmationDialog();
        return confirmation ?? false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (!Responsive.isDesktop(context))
                Expanded(
                  flex: 3,
                  child: Container(
                    width: double.infinity,
                    height: SizeConfig.screenHeight,
                    color: Colors.white,
                    child: SingleChildScrollView(
                      padding:
                          const EdgeInsets.only(top: 10, right: 5, left: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          LoginWidget(),
                        ],
                      ),
                    ),
                  ),
                ),
              if (Responsive.isDesktop(context))
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.only(
                        top: 50, right: 150.0, left: 150.0, bottom: 90),
                    children: const <Widget>[
                      LoginWidget(),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
