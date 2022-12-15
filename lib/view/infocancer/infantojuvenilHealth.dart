import 'package:flutter/material.dart';
import 'package:slimy_card/slimy_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../controller/ResponsiveScreen.dart';
import 'cancerinfantojuvenilHealth.dart';

class InfoCancerHealth extends StatefulWidget {
  const InfoCancerHealth({super.key});

  @override
  _InfoCancerHealth createState() => _InfoCancerHealth();
}

class _InfoCancerHealth extends State<InfoCancerHealth> {
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
    return Scaffold(
      // backgroundColor: Colors.brown[100],

      body: StreamBuilder(
        initialData: false,
        stream: slimyCard.stream,
        builder: ((BuildContext context, AsyncSnapshot snapshot) {
          return ListView(
              padding: const EdgeInsets.only(top: 50, right: 0, left: 0),
              children: <Widget>[
                if (Responsive.isDesktop(context))
                  Padding(
                    padding: const EdgeInsets.only(left: 100),
                    child: Column(
                      //mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Bem vindo,",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.bebasNeue(
                              fontSize: 20, color: Colors.black),
                        ),
                        Text(
                          "$_user",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.bebasNeue(
                              fontSize: 20, color: Colors.amber),
                        ),
                      ],
                    ),
                  ),

                if (!Responsive.isDesktop(context))
                  Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        //mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Bem vindo,",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.bebasNeue(
                                fontSize: 20, color: Colors.black),
                          ),
                          Text(
                            "$_user",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.bebasNeue(
                                fontSize: 20, color: Colors.amber),
                          ),
                        ],
                      )),
                if (Responsive.isDesktop(context))
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        //color: Colors.indigo[300],
                        height: 250,
                        width: 250,
                        child: Card(
                          color: Colors.indigo[600],
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          elevation: 5,
                          margin: const EdgeInsets.all(10),
                          child: InkWell(
                            splashColor: Colors.amber,
                            onTap: () {
                              PageController controller =
                                  PageController(initialPage: 0);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          CancerInfatojuvenilHealth(controller)));
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  'img/lconleu.png',
                                  height: 90,
                                  width: 90,
                                ),
                                Text(
                                  'Leucemias',
                                  style: GoogleFonts.roboto(
                                      fontSize: 20,
                                      color: Colors.white,
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.w500)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        //color: Colors.indigo[300],
                        height: 250,
                        width: 250,
                        child: Card(
                          color: Colors.orangeAccent,
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          elevation: 5,
                          margin: const EdgeInsets.all(10),
                          child: InkWell(
                            splashColor: Colors.amber,
                            onTap: () {
                              PageController controller =
                                  PageController(initialPage: 1);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          CancerInfatojuvenilHealth(controller)));
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  'img/linfoma.png',
                                  height: 90,
                                  width: 90,
                                ),
                                Text(
                                  'Linfoma',
                                  style: GoogleFonts.roboto(
                                      fontSize: 20,
                                      color: Colors.white,
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.w500)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        // color: Colors.pink[100],
                        height: 250,
                        width: 250,
                        child: Card(
                          color: Colors.pink[100],
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          elevation: 5,
                          margin: const EdgeInsets.all(10),
                          child: InkWell(
                            splashColor: Colors.amber,
                            onTap: () {
                              PageController controller =
                                  PageController(initialPage: 2);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          CancerInfatojuvenilHealth(controller)));
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  'img/glandula.png',
                                  height: 90,
                                  width: 90,
                                ),
                                Text(
                                  'Neuroblatoma',
                                  style: GoogleFonts.roboto(
                                      fontSize: 20,
                                      color: Colors.white,
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.w500)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        //color: Colors.indigo[300],
                        height: 250,
                        width: 250,
                        child: Card(
                          color: Colors.black,
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          elevation: 5,
                          margin: const EdgeInsets.all(10),
                          child: InkWell(
                            splashColor: Colors.amber,
                            onTap: () {
                              PageController controller =
                                  PageController(initialPage: 3);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          CancerInfatojuvenilHealth(controller)));
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  'img/rins.png',
                                  height: 90,
                                  width: 90,
                                ),
                                Text(
                                  'Tumor Wilms',
                                  style: GoogleFonts.roboto(
                                      fontSize: 20,
                                      color: Colors.white,
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.w500)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                if (Responsive.isDesktop(context))
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        // color: Colors.pink[100],
                        height: 250,
                        width: 250,
                        child: Card(
                          color: Colors.lightBlue,
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          elevation: 5,
                          margin: const EdgeInsets.all(10),
                          child: InkWell(
                            splashColor: Colors.amber,
                            onTap: () {
                              PageController controller =
                                  PageController(initialPage: 4);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          CancerInfatojuvenilHealth(controller)));
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  'img/rabdomio.png',
                                  height: 90,
                                  width: 90,
                                ),
                                Text(
                                  'Rabdomiossarcoma',
                                  style: GoogleFonts.roboto(
                                      fontSize: 20,
                                      color: Colors.white,
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.w500)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        //color: Colors.indigo[300],
                        height: 250,
                        width: 250,
                        child: Card(
                          color: Colors.red,
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          elevation: 5,
                          margin: const EdgeInsets.all(10),
                          child: InkWell(
                            splashColor: Colors.amber,
                            onTap: () {
                              PageController controller =
                                  PageController(initialPage: 5);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          CancerInfatojuvenilHealth(controller)));
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  'img/retino.png',
                                  height: 90,
                                  width: 90,
                                ),
                                Text(
                                  'Retinoblastoma',
                                  style: GoogleFonts.roboto(
                                      fontSize: 20,
                                      color: Colors.white,
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.w500)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        // color: Colors.pink[100],
                        height: 250,
                        width: 250,
                        child: Card(
                          color: Color.fromARGB(255, 6, 109, 3),
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          elevation: 5,
                          margin: const EdgeInsets.all(10),
                          child: InkWell(
                            splashColor: Colors.amber,
                            onTap: () {
                              PageController controller =
                                  PageController(initialPage: 6);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          CancerInfatojuvenilHealth(controller)));
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  'img/tumorosseo.png',
                                  height: 90,
                                  width: 90,
                                ),
                                Text(
                                  'Tumores Ósseos',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.roboto(
                                      fontSize: 20,
                                      color: Colors.white,
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.w500)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        //color: Colors.indigo[300],
                        height: 250,
                        width: 250,
                        child: Card(
                          color: Colors.pink[500],
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          elevation: 5,
                          margin: const EdgeInsets.all(10),
                          child: InkWell(
                            splashColor: Colors.amber,
                            onTap: () {
                              PageController controller =
                                  PageController(initialPage: 7);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          CancerInfatojuvenilHealth(controller)));
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  'img/cerebro.png',
                                  height: 90,
                                  width: 90,
                                ),
                                Text(
                                  '\nTumores do sistema nervoso central',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.roboto(
                                      fontSize: 20,
                                      color: Colors.white,
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.w500)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                if (!Responsive.isDesktop(context))
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        //color: Colors.indigo[300],
                        height: 180,
                        width: 180,
                        child: Card(
                          color: Colors.indigo[300],
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          elevation: 5,
                          margin: const EdgeInsets.all(10),
                          child: InkWell(
                            splashColor: Colors.amber,
                            onTap: () {
                              PageController controller =
                                  PageController(initialPage: 0);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          CancerInfatojuvenilHealth(controller)));
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  'img/lconleu.png',
                                  height: 90,
                                  width: 90,
                                ),
                                Text(
                                  'Leucemias',
                                  style: GoogleFonts.roboto(
                                      fontSize: 15,
                                      color: Colors.white,
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.w500)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        //color: Colors.indigo[300],
                        height: 180,
                        width: 180,
                        child: Card(
                          color: Colors.orangeAccent,
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          elevation: 5,
                          margin: const EdgeInsets.all(10),
                          child: InkWell(
                            splashColor: Colors.amber,
                            onTap: () {
                              PageController controller =
                                  PageController(initialPage: 1);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          CancerInfatojuvenilHealth(controller)));
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  'img/linfoma.png',
                                  height: 90,
                                  width: 90,
                                ),
                                Text(
                                  'Linfoma',
                                  style: GoogleFonts.roboto(
                                      fontSize: 15,
                                      color: Colors.white,
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.w500)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                //MOBILE
                if (!Responsive.isDesktop(context))
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        // color: Colors.pink[100],
                        height: 180,
                        width: 180,
                        child: Card(
                          color: Colors.pink[100],
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          elevation: 5,
                          margin: const EdgeInsets.all(10),
                          child: InkWell(
                            splashColor: Colors.amber,
                            onTap: () {
                              PageController controller =
                                  PageController(initialPage: 2);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          CancerInfatojuvenilHealth(controller)));
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  'img/glandula.png',
                                  height: 90,
                                  width: 90,
                                ),
                                Text(
                                  'Neuroblatoma',
                                  style: GoogleFonts.roboto(
                                      fontSize: 15,
                                      color: Colors.white,
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.w500)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        //color: Colors.indigo[300],
                        height: 180,
                        width: 180,
                        child: Card(
                          color: Colors.black,
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          elevation: 5,
                          margin: const EdgeInsets.all(10),
                          child: InkWell(
                            splashColor: Colors.amber,
                            onTap: () {
                              PageController controller =
                                  PageController(initialPage: 3);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          CancerInfatojuvenilHealth(controller)));
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  'img/rins.png',
                                  height: 90,
                                  width: 90,
                                ),
                                Text(
                                  'Tumor Wilms',
                                  style: GoogleFonts.roboto(
                                      fontSize: 15,
                                      color: Colors.white,
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.w500)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                if (!Responsive.isDesktop(context))
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        // color: Colors.pink[100],
                        height: 180,
                        width: 180,
                        child: Card(
                          color: Colors.lightBlue,
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          elevation: 5,
                          margin: const EdgeInsets.all(10),
                          child: InkWell(
                            splashColor: Colors.amber,
                            onTap: () {
                              PageController controller =
                                  PageController(initialPage: 4);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          CancerInfatojuvenilHealth(controller)));
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  'img/rabdomio.png',
                                  height: 90,
                                  width: 90,
                                ),
                                Text(
                                  'Rabdomiossarcoma',
                                  style: GoogleFonts.roboto(
                                      fontSize: 15,
                                      color: Colors.white,
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.w500)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        //color: Colors.indigo[300],
                        height: 180,
                        width: 180,
                        child: Card(
                          color: Colors.red,
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          elevation: 5,
                          margin: const EdgeInsets.all(10),
                          child: InkWell(
                            splashColor: Colors.amber,
                            onTap: () {
                              PageController controller =
                                  PageController(initialPage: 5);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          CancerInfatojuvenilHealth(controller)));
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  'img/retino.png',
                                  height: 90,
                                  width: 90,
                                ),
                                Text(
                                  'Retinoblastoma',
                                  style: GoogleFonts.roboto(
                                      fontSize: 15,
                                      color: Colors.white,
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.w500)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                if (!Responsive.isDesktop(context))
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        // color: Colors.pink[100],
                        height: 180,
                        width: 180,
                        child: Card(
                          color: Color.fromARGB(255, 6, 109, 3),
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          elevation: 5,
                          margin: const EdgeInsets.all(10),
                          child: InkWell(
                            splashColor: Colors.amber,
                            onTap: () {
                              PageController controller =
                                  PageController(initialPage: 6);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          CancerInfatojuvenilHealth(controller)));
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  'img/tumorosseo.png',
                                  height: 90,
                                  width: 90,
                                ),
                                Text(
                                  'Tumores Ósseos',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.roboto(
                                      fontSize: 15,
                                      color: Colors.white,
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.w500)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        //color: Colors.indigo[300],
                        height: 180,
                        width: 180,
                        child: Card(
                          color: Colors.pink[500],
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          elevation: 5,
                          margin: const EdgeInsets.all(10),
                          child: InkWell(
                            splashColor: Colors.amber,
                            onTap: () {
                              PageController controller =
                                  PageController(initialPage: 7);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          CancerInfatojuvenilHealth(controller)));
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  'img/cerebro.png',
                                  height: 90,
                                  width: 90,
                                ),
                                Text(
                                  'Tumores do sistema nervoso central',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.roboto(
                                      fontSize: 15,
                                      color: Colors.white,
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.w500)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
              ]);
        }),
      ),
    );
  }
}
