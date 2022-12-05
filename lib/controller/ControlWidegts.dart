

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class controlWidget extends StatefulWidget {
  int _paginaAtual = 0;

  controlWidget(this._paginaAtual, {Key? key}) : super(key: key);
  @override
  _controlWidget createState() => _controlWidget();
}

class _controlWidget extends State<controlWidget> {
  final List<Widget> _telas = [];

  void aoMudarDeAba(int indice) {
    setState(() {
      widget._paginaAtual = indice;
    });
  }

  Future<bool?> showWarning(BuildContext context) async => showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Você tem certeza que quer sair da aplicação ?'),
          actions: [
            ElevatedButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('não')),
            ElevatedButton(
                onPressed: () => Navigator.pop(context, true),
                child: const Text('Sim'))
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        print('voltar');
        final shouldpop = await showWarning(context);
        return shouldpop ?? false;
      },
      child: Scaffold(
        //appBar: AppBar(title: Text("AquaHelp"), centerTitle: true),
        body: _telas[widget._paginaAtual],
        
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: widget._paginaAtual,
          onTap: aoMudarDeAba,
          items: const [
            
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
              // backgroundColor: Color.fromARGB(250, 26, 35, 126)
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_box_outlined),
              label: "Analise",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info),
              label: "Sobre",
            ),
          ],
        ),
      ),
    );
  }
}
