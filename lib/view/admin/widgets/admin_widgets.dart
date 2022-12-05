import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../controller/RealtimeDatabase.dart';

class AdminWidget extends StatelessWidget {
  final DataSnapshot snapshot;

  const AdminWidget({super.key, required this.snapshot});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Theme.of(context).colorScheme.outline,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      elevation: 5,
      child: InkWell(
        splashColor: Colors.blueAccent,
        onTap: () {},
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ListTile(
              title: const Text(
                'Nome do jogo:',
                style: TextStyle(fontSize: 42),
              ),
              subtitle: Text(
                snapshot.child("title").value.toString(),
                style: GoogleFonts.roboto(
                    fontSize: 32, fontWeight: FontWeight.normal),
                textAlign: TextAlign.left,
              ),
            ),
            ListTile(
              title: const Text(
                "Descrição :",
                style: TextStyle(fontSize: 42),
                textAlign: TextAlign.left,
              ),
              subtitle: Text(
                snapshot.child("description").value.toString(),
                style: GoogleFonts.roboto(
                    fontSize: 25, fontWeight: FontWeight.normal),
                textAlign: TextAlign.left,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  child: Text(
                    snapshot.child("url").value.toString(),
                    style: const TextStyle(color: Colors.blue),
                  ),
                  onPressed: () {
                    _launchURL();
                  },
                ),
                const SizedBox(
                  width: 20,
                ),
                TextButton.icon(
                  onPressed: () {
                    RealtimeDatabase().removecard(snapshot);
                  },
                  icon: const Icon(Icons.delete),
                  label: Text(
                    'Excluir',
                    style: GoogleFonts.roboto(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Colors.blue),
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _launchURL() async {
    String link = snapshot.child("url").value.toString();
    String url = 'https://$link';
    if (await canLaunchUrlString(url)) {
      await launch(url, forceWebView: false, forceSafariVC: false);
    } else {
      throw 'Could not launch $url';
    }
  }
}
