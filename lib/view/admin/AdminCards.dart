import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';


import '../../controller/ResponsiveScreen.dart';
import '../../controller/auth_service.dart';
import 'CardsSaude.dart';
import 'add_card.dart';
import 'cardsEducacao.dart';

class AdminCard extends StatefulWidget {
  const AdminCard({Key? key}) : super(key: key);
  @override
  _AdminCard createState() => _AdminCard();
}

class _AdminCard extends State<AdminCard> {
  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Cards Admin",
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            )),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'sair',
            onPressed: () {
              AuthService(FirebaseAuth.instance).signOut(context);
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => const AddCard())),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (Responsive.isDesktop(context))
            Expanded(
              flex: 4,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0)),
                elevation: 5.0,
                child: ListView(
                  padding: const EdgeInsets.only(
                      top: 150.0, right: 350.0, left: 350.0, bottom: 150),
                  children: <Widget>[
                    const Text(
                      "Cards",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      height: 40,
                      child: TextButton(
                        child: const Text(
                          "Cards Saude",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const CardsSaude())),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      height: 40,
                      child: TextButton(
                        child: const Text(
                          "Cards Educação",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const CardsEduca())),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          if (!Responsive.isDesktop(context))
            Expanded(
              flex: 3,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0)),
                elevation: 5.0,
                child: ListView(
                  padding: const EdgeInsets.only(
                      top: 100.0, right: 50.0, left: 50.0),
                  children: <Widget>[
                    const Text(
                      textAlign: TextAlign.center,
                      "Cards",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        border: Border.all(
                          color: Colors.white,
                          width: 2.0,
                        ),
                      ),
                      width: 60,
                      height: 40,
                      child: TextButton(
                        child: const Text(
                          "Cards Saude",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const CardsSaude())),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        border: Border.all(
                          color: Colors.white,
                          width: 2.0,
                        ),
                      ),
                      height: 40,
                      child: TextButton(
                        child: const Text(
                          "Cards Educação",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const CardsEduca())),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
