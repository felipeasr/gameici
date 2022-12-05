import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import '../../controller/RealtimeDatabase.dart';
import '../../controller/ResponsiveScreen.dart';
import '../../controller/SizeConfig.dart';
import 'widgets/admin_widgets.dart';
import 'add_card.dart';

class CardsSaude extends StatefulWidget {
  const CardsSaude({Key? key}) : super(key: key);
  @override
  _CardsSaude createState() => _CardsSaude();
}

class _CardsSaude extends State<CardsSaude> {
  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Cards Saúde",
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            )),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => const AddCard())),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (Responsive.isDesktop(context))
              FutureBuilder(
                future: RealtimeDatabase().getQuerycardSaude(),
                builder: (BuildContext context, AsyncSnapshot<Query> snapshot) {
                  if (snapshot.hasData) {
                    return Flexible(
                      child: FirebaseAnimatedList(
                        padding: const EdgeInsets.all(10),
                        query: snapshot.data as Query,
                        itemBuilder: (_, DataSnapshot snapshot,
                            Animation<double> animation, int x) {
                          return AdminWidget(
                            snapshot: snapshot,
                          );
                        },
                      ),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              )
            else if (!Responsive.isDesktop(context))
              FutureBuilder(
                future: RealtimeDatabase().getQuerycardSaude(),
                builder: (BuildContext context, AsyncSnapshot<Query> snapshot) {
                  if (snapshot.hasData) {
                    return Flexible(
                      child: FirebaseAnimatedList(
                        padding: const EdgeInsets.all(10),
                        query: snapshot.data as Query,
                        itemBuilder: (_, DataSnapshot snapshot,
                            Animation<double> animation, int x) {
                          return AdminWidget(
                            snapshot: snapshot,
                          );
                        },
                      ),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              )
          ],
        ),
      ),
    );
  }
}
