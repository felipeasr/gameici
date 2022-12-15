import 'package:flutter/cupertino.dart';
import 'package:gameici/view/infocancer/widgets/leucemia_widgets.dart';
import 'package:slimy_card/slimy_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';

import '../../controller/ResponsiveScreen.dart';
import '../../controller/SizeConfig.dart';
import '../../controller/UserVerification.dart';

class CancerInfatojuvenilHealth extends StatefulWidget {
  CancerInfatojuvenilHealth(this.controller, {Key? key}) : super(key: key);
  PageController controller = PageController(initialPage: 0);
  @override
  _CancerInfatojuvenilHealth createState() => _CancerInfatojuvenilHealth();
}

class _CancerInfatojuvenilHealth extends State<CancerInfatojuvenilHealth> {
  //final controller = PageController(initialPage: 0);

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

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        hoverColor: Colors.white,
        //materialTapTargetSize: MaterialTapTargetSize.padded,
        backgroundColor: Colors.amber,
        onPressed: () {},
        label: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
                onPressed: () => widget.controller.previousPage(
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOut),
                icon: const Icon(
                  Icons.keyboard_arrow_left,
                  color: Colors.black,
                )),
            IconButton(
                onPressed: () => widget.controller.nextPage(
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOut),
                icon: const Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.black,
                ))
          ],
        ),
      ),
      body: PageView(
        scrollDirection: Axis.horizontal,
        controller: widget.controller,
        children: [
          Column(
            children: [
              if (!Responsive.isDesktop(context))
                Expanded(
                  flex: 3,
                  child: SizedBox(
                    width: double.infinity,
                    height: SizeConfig.screenHeight,
                    child: SingleChildScrollView(
                      padding:
                          const EdgeInsets.only(top: 10, right: 3, left: 3),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          LeucemiaWidget(),
                        ],
                      ),
                    ),
                  ),
                ),
              if (Responsive.isDesktop(context))
                Expanded(
                  flex: 3,
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.only(top: 10, right: 5, left: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        LeucemiaWidget(),
                      ],
                    ),
                  ),
                ),
            ],
          ),
          Container(
            color: Colors.orangeAccent[100],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 100, left: 60),
                  child: Row(
                    children: [
                      TextButton.icon(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const user_verification()));
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          label: const Text(
                            "Voltar",
                            style: TextStyle(color: Colors.white),
                          )),
                    ],
                  ),
                ),
                Image.asset(
                  'img/linfoma.png',
                  height: 90,
                  width: 90,
                ),
                const Text(
                  'Linfoma',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.pink[100],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 100, left: 60),
                  child: Row(
                    children: [
                      TextButton.icon(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const user_verification()));
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          label: const Text(
                            "Voltar",
                            style: TextStyle(color: Colors.white),
                          )),
                    ],
                  ),
                ),
                Image.asset(
                  'img/glandula.png',
                  height: 90,
                  width: 90,
                ),
                const Text(
                  'Neuroblastoma',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.black,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 100, left: 60),
                  child: Row(
                    children: [
                      TextButton.icon(
                          onPressed: () {
                            int _paginaAtual = 1;
                            int _selectedIndex = 1;
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const user_verification()));
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          label: const Text(
                            "Voltar",
                            style: TextStyle(color: Colors.white),
                          )),
                    ],
                  ),
                ),
                Image.asset(
                  'img/rins.png',
                  height: 90,
                  width: 90,
                ),
                const Text(
                  'Linfoma',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.lightBlue,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 100, left: 60),
                  child: Row(
                    children: [
                      TextButton.icon(
                          onPressed: () {
                            int _paginaAtual = 1;
                            int _selectedIndex = 1;
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const user_verification()));
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          label: const Text(
                            "Voltar",
                            style: TextStyle(color: Colors.white),
                          )),
                    ],
                  ),
                ),
                Image.asset(
                  'img/rabdomio.png',
                  height: 90,
                  width: 90,
                ),
                const Text(
                  'Rabdomiossarcoma',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.redAccent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 100, left: 60),
                  child: Row(
                    children: [
                      TextButton.icon(
                          onPressed: () {
                            int _paginaAtual = 1;
                            int _selectedIndex = 1;
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const user_verification()));
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          label: const Text(
                            "Voltar",
                            style: TextStyle(color: Colors.white),
                          )),
                    ],
                  ),
                ),
                Image.asset(
                  'img/retino.png',
                  height: 90,
                  width: 90,
                ),
                const Text(
                  'Retinoblastoma',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ),
          Container(
            color: Color.fromARGB(255, 6, 109, 3),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 100, left: 60),
                  child: Row(
                    children: [
                      TextButton.icon(
                          onPressed: () {
                            int _paginaAtual = 1;
                            int _selectedIndex = 1;
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const user_verification()));
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          label: const Text(
                            "Voltar",
                            style: TextStyle(color: Colors.white),
                          )),
                    ],
                  ),
                ),
                Image.asset(
                  'img/tumorosseo.png',
                  height: 90,
                  width: 90,
                ),
                const Text(
                  'Tumores Ósseos',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.pink[500],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 100, left: 60),
                  child: Row(
                    children: [
                      TextButton.icon(
                          onPressed: () {
                            int _paginaAtual = 1;
                            int _selectedIndex = 1;
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const user_verification()));
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          label: const Text(
                            "Voltar",
                            style: TextStyle(color: Colors.white),
                          )),
                    ],
                  ),
                ),
                Image.asset(
                  'img/cerebro.png',
                  height: 90,
                  width: 90,
                ),
                const Text(
                  'Tumores do sistema nervoso central',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
