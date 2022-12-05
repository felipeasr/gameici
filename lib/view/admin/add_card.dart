import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';

import '../../controller/RealtimeDatabase.dart';
import '../../controller/ResponsiveScreen.dart';
import '../../model/cards_model.dart';
import 'AdminCards.dart';
import 'CardsSaude.dart';
import 'cardsEducacao.dart';

class AddCard extends StatefulWidget {
  const AddCard({Key? key}) : super(key: key);

  @override
  State<AddCard> createState() => _AddCard();
}

class _AddCard extends State<AddCard> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _urlController = TextEditingController();

  String title = '';
  String? type = "";
  String description = '';
  String url = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Card'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => const AdminCard())),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
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
                        top: 150.0, right: 150.0, left: 150.0),
                    children: [
                      DropDownFormField(
                        required: true,
                        titleText: 'Para qual profissional ?',
                        hintText: 'Porfavor selecione o Profissional',
                        value: type,
                        onSaved: (value) {
                          setState(() {
                            type = value;
                          });
                        },
                        onChanged: (value) {
                          setState(() {
                            type = value;
                          });
                        },
                        dataSource: const [
                          {
                            "display": "Saúde",
                            "value": "Saude",
                          },
                          {
                            "display": "Educação",
                            "value": "Educacao",
                          },
                          {
                            "display": "os dois",
                            "value": "os dois",
                          },
                        ],
                        textField: 'display',
                        valueField: 'value',
                      ),
                      TextFormField(
                        controller: _titleController,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.gamepad),
                          labelText: "Nome do Jogo",
                          labelStyle: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          ),
                        ),
                        style: const TextStyle(fontSize: 20),
                      ),
                      TextFormField(
                        controller: _urlController,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.link),
                          labelText: "Link do Jogo",
                          labelStyle: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          ),
                        ),
                        style: const TextStyle(fontSize: 20),
                      ),
                      TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: const InputDecoration(
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            hintText: 'Descrição'),
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                        controller: _descriptionController,
                      ),
                    ],
                  ),
                ),
              ),
            if (!Responsive.isDesktop(context))
              Expanded(
                flex: 4,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0)),
                  elevation: 5.0,
                  child: ListView(
                    padding: const EdgeInsets.only(
                        top: 25.0, right: 20.0, left: 20.0),
                    children: [
                      DropDownFormField(
                        required: true,
                        titleText: 'Para qual profissional ?',
                        hintText: 'Porfavor selecione o Profissional',
                        value: type,
                        onSaved: (value) {
                          setState(() {
                            type = value;
                          });
                        },
                        onChanged: (value) {
                          setState(() {
                            type = value;
                          });
                        },
                        dataSource: const [
                          {
                            "display": "Saúde",
                            "value": "Saude",
                          },
                          {
                            "display": "Educação",
                            "value": "Educacao",
                          },
                          {
                            "display": "os dois",
                            "value": "os dois",
                          },
                        ],
                        textField: 'display',
                        valueField: 'value',
                      ),
                      TextFormField(
                        controller: _titleController,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.gamepad),
                          labelText: "Nome do Jogo",
                          labelStyle: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          ),
                        ),
                        style: const TextStyle(fontSize: 20),
                      ),
                      TextFormField(
                        controller: _urlController,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.link),
                          labelText: "Link do Jogo",
                          labelStyle: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          ),
                        ),
                        style: const TextStyle(fontSize: 20),
                      ),
                      TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: const InputDecoration(
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            hintText: 'Descrição do Jogo'),
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                        controller: _descriptionController,
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.save),
          onPressed: () {
            if (type.toString() == "Saude") {
              setState(() {
                title = _titleController.text;
                description = _descriptionController.text;
                url = _urlController.text;
                Cardmodel card =
                    Cardmodel(title: title, url: url, description: description);
                RealtimeDatabase().addcardSaude(card).then((value) =>
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const CardsSaude())));
              });
            } else if (type.toString() == "Educacao") {
              setState(() {
                title = _titleController.text;
                description = _descriptionController.text;
                url = _urlController.text;
                Cardmodel card =
                    Cardmodel(title: title, url: url, description: description);
                RealtimeDatabase().addcardEduca(card).then((value) =>
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const CardsEduca())));
              });
            } else {
              setState(() {
                title = _titleController.text;
                description = _descriptionController.text;
                url = _urlController.text;
                Cardmodel card =
                    Cardmodel(title: title, url: url, description: description);
                RealtimeDatabase().addcardSaude(card);
                RealtimeDatabase().addcardEduca(card).then((value) =>
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const CardsEduca())));
              });
            }
          }),
    );
  }
}
