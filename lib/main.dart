import 'package:babysleep/ui/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'homes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Baby Sleep Sound',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: HomeaPage(),
    );
  }
}



