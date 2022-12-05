import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:gameici/view/health/widgets/cards_widgets.dart';
import '../../controller/RealtimeDatabase.dart';
import '../../controller/ResponsiveScreen.dart';
import '../../controller/SizeConfig.dart';

class CardsSaudeUser extends StatelessWidget {
  const CardsSaudeUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
    SizeConfig().init(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
              FutureBuilder(
                future: RealtimeDatabase().getQuerycardSaude(),
                builder: (BuildContext context, AsyncSnapshot<Query> snapshot) {
                  if (snapshot.hasData) {
                    return Flexible(
                      child: FirebaseAnimatedList(
                        padding: const EdgeInsets.only(
                            top: 100.0,
                            right: 200.0,
                            left: 200.0,
                            bottom: 50.0),
                        query: snapshot.data as Query,
                        itemBuilder: (_, DataSnapshot snapshot,
                            Animation<double> animation, int x) {
                          return CardsWidget(
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
                        padding: const EdgeInsets.only(
                            top: 70.0, right: 20.0, left: 20.0, bottom: 40.0),
                        query: snapshot.data as Query,
                        itemBuilder: (_, DataSnapshot snapshot,
                            Animation<double> animation, int x) {
                          return CardsWidget(
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
