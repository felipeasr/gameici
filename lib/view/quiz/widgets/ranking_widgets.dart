import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RankingWidget extends StatelessWidget {
  const RankingWidget({super.key, required this.snapshot});
  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        //physics: const BouncingScrollPhysics(),
        itemCount: snapshot.data?.docs.length,
        itemBuilder: (context, index) {
          DocumentSnapshot data = snapshot.data!.docs[index];
          print(data);
          int position = index + 1;
          if (position == 1) {
            return Card(
                color: Colors.amber,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                ),
                elevation: 5,
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        '#$position',
                        style: GoogleFonts.bebasNeue(fontSize: 50),
                      ),
                      subtitle: Text(
                        '${data['email']}',
                        style: GoogleFonts.bebasNeue(fontSize: 20),
                      ),
                      trailing: Text(
                        'Pontos: ${data['pontuacao']}',
                        style: GoogleFonts.bebasNeue(fontSize: 20),
                      ),
                    )
                  ],
                ));
          } else {
            return Card(
                color: Color.fromARGB(255, 3, 108, 194),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                ),
                elevation: 5,
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        '#$position',
                        style: GoogleFonts.bebasNeue(fontSize: 50),
                      ),
                      subtitle: Text(
                        '${data['email']}',
                        style: GoogleFonts.bebasNeue(fontSize: 20),
                      ),
                      trailing: Text(
                        'Pontos: ${data['pontuacao']}',
                        style: GoogleFonts.bebasNeue(fontSize: 20),
                      ),
                    )
                  ],
                ));
          }
        });
  }
}
