import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controller/UserVerification.dart';

class LeucemiaWidgetEducation extends StatelessWidget {
  const LeucemiaWidgetEducation({super.key});
  @override
  Widget build(BuildContext context) {
    List<String> str = [
      "Palidez cutâneo-mucosa;",
      "Fadiga;",
      "irritabilidade;",
      "Sangramentos anormais sem causa definida;",
      "Febre;",
      "Dor óssea,articular, generalizada;",
      "Hepatoesplenomegalia;",
      "Linfadenomegalia generalizada."
    ];

    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.indigo[600],
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0))),
          //color: Colors.indigo[600],
          child: Padding(
            padding: const EdgeInsets.only(top: 30, right: 50, left: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
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
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'img/lconleu.png',
                        height: 120,
                        width: 120,
                      ),
                      SelectableText(
                        'Leucemias',
                        style: GoogleFonts.roboto(
                            fontSize: 28,
                            color: Colors.white,
                            textStyle:
                                const TextStyle(fontWeight: FontWeight.w500)),
                      ),
                    ])
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 50, left: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SelectableText(
                '\nÉ um tipo de câncer do sangue, que se origina principalmente por alterações nas células brancas. Tem como principal característica a invasão de células doentes na medula óssea (parte interna do osso).\n',
                style: GoogleFonts.roboto(
                    fontSize: 24,
                    color: Colors.black,
                    textStyle: const TextStyle(fontWeight: FontWeight.w500)),
                textAlign: TextAlign.justify,
              ),
              SelectableText('Sintomas:',
                  style: GoogleFonts.roboto(
                      fontSize: 24,
                      color: Colors.black,
                      textStyle: const TextStyle(fontWeight: FontWeight.w500)),
                  textAlign: TextAlign.justify),
              Column(
                children: str.map((strone) {
                  return Row(children: [
                    Text("\u2022",
                        style: GoogleFonts.roboto(
                            fontSize: 24,
                            color: Colors.black,
                            textStyle:
                                const TextStyle(fontWeight: FontWeight.w500)),
                        textAlign: TextAlign.justify),

                    const SizedBox(
                      width: 10,
                    ), //space between bullet and text
                    Expanded(
                      child: SelectableText(
                        strone,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 24),
                        textAlign: TextAlign.justify,
                      ), //text
                    )
                  ]);
                }).toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
