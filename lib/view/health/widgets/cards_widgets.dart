import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class CardsWidget extends StatelessWidget {
  final DataSnapshot snapshot;

  const CardsWidget({super.key, required this.snapshot});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.amber,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Theme.of(context).colorScheme.outline,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      elevation: 5,
      child: InkWell(
        splashColor: Colors.blueAccent,
        onTap: () {
          _launchURL();
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ListTile(
              title: const Text(
                'Nome do jogo:',
                style: TextStyle(fontSize: 30),
              ),
              subtitle: Text(
                snapshot.child("title").value.toString(),
                style: GoogleFonts.roboto(
                    fontSize: 24, fontWeight: FontWeight.normal),
                textAlign: TextAlign.left,
              ),
            ),
            ListTile(
              title: const Text(
                "Descrição :",
                style: TextStyle(fontSize: 30),
                textAlign: TextAlign.left,
              ),
              subtitle: Text(
                snapshot.child("description").value.toString(),
                style: GoogleFonts.roboto(
                    fontSize: 24, fontWeight: FontWeight.normal),
                textAlign: TextAlign.left,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  child: Text(
                    'link do jogo',
                    style: TextStyle(color: Colors.blue[900]),
                  ),
                  onPressed: () {
                    _launchURL();
                  },
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
      await launch(url, forceWebView: false);
    } else {
      throw 'Could not launch $url';
    }
  }
}
