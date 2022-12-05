import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'controller/AuthCheck.dart';

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          //colorSchemeSeed: Colors.yellowAccent,
          primarySwatch: Colors.amber,
          useMaterial3: true),
      home: const AuthCheck(),
    );
  }
}
