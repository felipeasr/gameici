import 'package:flutter/material.dart';
import 'package:gameici/view/quiz/quizScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../controller/ResponsiveScreen.dart';
import '../view/education/CardsEducaUser.dart';
import '../view/infocancer/cancerinfantojuvenil.dart';
import '../view/infocancer/infantojuvenil.dart';
import 'auth_service.dart';

class ControllerBarEducation extends StatefulWidget {
  ControllerBarEducation(this._paginaAtual, this._selectedIndex, {Key? key})
      : super(key: key);
  int _selectedIndex = 0;
  late int _paginaAtual = 0;

  @override
  _ControllerBarEducation createState() => _ControllerBarEducation();
}

class _ControllerBarEducation extends State<ControllerBarEducation> {
  String _user = '';
  @override
  void initState() {
    super.initState();
    _checkuser();
  }

  void _checkuser() async {
    User? user = FirebaseAuth.instance.currentUser;
    final DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(user?.uid)
        .get();

    setState(() {
      _user = snap['email'];
      print(_user);
    });
  }

  final List<Widget> _telas = [
    const InfoCancer(),
    QuizPage(),
    const CardsEducacaoUser(),
  ];
  void aoMudarDeAba(int indice) {
    setState(() {
      widget._paginaAtual = indice;
    });
  }

  @override
  Widget build(BuildContext context) {
    Future<bool?> showconfirmationDialog() {
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Fazer Logout?"),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context, false),
                    child: const Text(
                      "Cancelar",
                      style: TextStyle(color: Colors.black),
                    )),
                TextButton(
                    onPressed: () {
                      AuthService(FirebaseAuth.instance).signOut(context);
                      true;
                    },
                    child: const Text(
                      "Sair",
                      style: TextStyle(color: Colors.black),
                    ))
              ],
            );
          });
    }

    return WillPopScope(
      onWillPop: () async {
        final confirmation = await showconfirmationDialog();
        return confirmation ?? false;
      },
      child: Scaffold(
        //backgroundColor: Colors.transparent,
        body: (Responsive.isDesktop(context))
            ? Row(
                children: [
                  NavigationRail(
                    trailing: Column(children: [
                      IconButton(
                          onPressed: () {
                            showconfirmationDialog();
                          },
                          icon: const Icon(Icons.logout_outlined),
                          selectedIcon: const Icon(Icons.logout)),
                    ]),
                    leading: Column(children: const [
                      CircleAvatar(
                        backgroundColor: Colors.yellow,
                        backgroundImage: NetworkImage(
                          'https://i0.wp.com/ici.ong/wp-content/uploads/2016/10/leao.png?ssl=1',
                        ),
                        radius: 70.0,
                      ),
                    ]),
                    groupAlignment: -1,
                    backgroundColor: Colors.transparent,
                    selectedIndex: widget._selectedIndex,
                    onDestinationSelected: (int index) {
                      setState(() {
                        widget._selectedIndex = index;
                      });
                    },
                    labelType: NavigationRailLabelType.selected,
                    destinations: const [
                      NavigationRailDestination(
                        icon: Icon(Icons.info_outline),
                        selectedIcon: Icon(Icons.info),
                        label: Text('Cancer Infantojuvenil'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.quiz_outlined),
                        selectedIcon: Icon(Icons.quiz),
                        label: Text('Quiz'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.gamepad_outlined),
                        selectedIcon: Icon(Icons.gamepad),
                        label: Text('Jogos'),
                      ),
                    ],
                  ),
                  const VerticalDivider(thickness: 1, width: 1),
                  // This is the main content.
                  Expanded(
                      child: (widget._selectedIndex == 0)
                          ? const InfoCancer()
                          : (widget._selectedIndex == 1)
                              ? QuizPage()
                              : (widget._selectedIndex == 2)
                                  ? const CardsEducacaoUser()
                                  : Container())
                ],
              )
            : _telas[widget._paginaAtual],
        bottomNavigationBar:
            !(Responsive.isDesktop(context)) ? buildMyNavBar(context) : Row(),
      ),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            enableFeedback: true,
            onPressed: () {
              setState(() {
                widget._paginaAtual = 0;
              });
            },
            icon: widget._paginaAtual == 0
                ? const Icon(
                    Icons.info,
                    color: Colors.black,
                    size: 35,
                  )
                : const Icon(
                    Icons.info_outline,
                    color: Colors.black,
                    size: 35,
                  ),
          ),
          IconButton(
            enableFeedback: true,
            onPressed: () {
              setState(() {
                widget._paginaAtual = 1;
              });
            },
            icon: widget._paginaAtual == 1
                ? const Icon(
                    Icons.quiz,
                    color: Colors.black,
                    size: 35,
                  )
                : const Icon(
                    Icons.quiz_outlined,
                    color: Colors.black,
                    size: 35,
                  ),
          ),
          IconButton(
            enableFeedback: true,
            onPressed: () {
              setState(() {
                widget._paginaAtual = 2;
              });
            },
            icon: widget._paginaAtual == 2
                ? const Icon(
                    Icons.gamepad,
                    color: Colors.black,
                    size: 35,
                  )
                : const Icon(
                    Icons.gamepad_outlined,
                    color: Colors.black,
                    size: 35,
                  ),
          ),
        ],
      ),
    );
  }
}
