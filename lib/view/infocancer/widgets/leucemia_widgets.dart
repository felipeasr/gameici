import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controller/ResponsiveScreen.dart';
import '../../../controller/UserVerification.dart';

class LeucemiaWidget extends StatelessWidget {
  const LeucemiaWidget({super.key});
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
    List<String> str2 = [
      "Sinais de sangramento ativo: petéquias, epistaxe;",
      "Plaquetopenia: contagem de plaquetas menor do que 20.000/ mm3;",
      "Leucocitose: leucócitos totais em quantidade maior que 50.000/ mm3;",
      "Anemia grave: hemoglobina menor do que 6,0 g/dL.",
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
              SelectableText('Emergência:',
                  style: GoogleFonts.roboto(
                      fontSize: 24,
                      color: Colors.black,
                      textStyle: const TextStyle(fontWeight: FontWeight.w500)),
                  textAlign: TextAlign.justify),
              Column(
                children: str2.map((strone) {
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
        if (Responsive.isDesktop(context))
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'img/leucemia.png',
                  height: 1000,
                  width: 1000,
                ),
              ]),
        if (!Responsive.isDesktop(context))
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'img/leucemia.png',
                  height: 500,
                  width: 500,
                ),
              ]),
      ],
    );
  }
}
