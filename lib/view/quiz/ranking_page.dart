import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gameici/controller/controllerBarHealth.dart';
import 'package:gameici/view/quiz/quizScreen.dart';
import 'package:gameici/view/quiz/widgets/ranking_widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../controller/ResponsiveScreen.dart';
import '../../controller/SizeConfig.dart';
import '../../controller/UserVerification.dart';

class RankingPage extends StatefulWidget {
  const RankingPage({super.key});

  @override
  _rakingpage createState() => _rakingpage();
}

class _rakingpage extends State<RankingPage> {
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> usersStream = FirebaseFirestore.instance
        .collection('ranking')
        .orderBy('pontuacao', descending: true)
        .snapshots();
    // print(usersStream.first);
    //GlobalKey<ScaffoldState> drawerKey = GlobalKey();
    SizeConfig().init(context);
    return Scaffold(
      //backgroundColor: Colors.blue,
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
              Padding(
                padding: EdgeInsets.only(right: 300, left: 300),
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
                          color: Colors.amber,
                        ),
                        label: const Text(
                          "Voltar",
                          style: TextStyle(color: Colors.amber),
                        )),
                  ],
                ),
              ),
            if (!Responsive.isDesktop(context))
              Padding(
                padding: const EdgeInsets.only(top: 25, right: 30),
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
                          color: Colors.amber,
                        ),
                        label: const Text(
                          "Voltar",
                          style: TextStyle(color: Colors.amber),
                        )),
                  ],
                ),
              ),
            Text(
              'Ranking',
              style: GoogleFonts.bebasNeue(fontSize: 70),
            ),

            if (Responsive.isDesktop(context))
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.only(right: 300, left: 300),
                  child: StreamBuilder<QuerySnapshot>(
                    stream: usersStream,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return const Center(child: Text("Desconectado"));
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: Text("carregando ...."));
                      }

                      return RankingWidget(
                        snapshot: snapshot,
                      );
                    },
                  ),
                ),
              ),
            // if (Responsive.isDesktop(context)) GetUserName(),
            if (!Responsive.isDesktop(context))
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: usersStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return const Center(child: Text("Desconectado"));
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: Text("carregando ...."));
                    }
                    return RankingWidget(
                      snapshot: snapshot,
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
