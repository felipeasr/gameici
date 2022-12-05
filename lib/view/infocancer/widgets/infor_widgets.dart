import 'package:flutter/material.dart';
import 'package:slimy_card/slimy_card.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Row(
                    children: const <Widget>[InfoWidget()],
                  ),
        const SizedBox(
          height: 10,
        ),
        SlimyCard(
          topCardHeight: 200,
          bottomCardHeight: 400,
          //color: Colors.indigo[300],
          topCardWidget: topCardWidget(),
          bottomCardWidget: bottomCardWidget(),
        ),
        SlimyCard(
          topCardHeight: 200,
          bottomCardHeight: 400,
          //color: Colors.indigo[300],
          topCardWidget: topCardWidget(),
          bottomCardWidget: bottomCardWidget(),
        ),
        SlimyCard(
          topCardHeight: 200,
          bottomCardHeight: 400,
          //color: Colors.indigo[300],
          topCardWidget: topCardWidget(),
          bottomCardWidget: bottomCardWidget(),
        ),
      ],
    );
  }

  Widget topCardWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 90,
          width: 150,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('img/lconleu.png'),
              fit: BoxFit.fill,
            ),
            shape: BoxShape.circle,
          ),
        ),
        const Text(
          'Leucemia',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ],
    );
  }

  Widget bottomCardWidget() {
    return ListView(
      children: [
        ElevatedButton(
            onPressed: () {},
            child: const Text(
              "button",
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ))
      ],
    );
  }
}
