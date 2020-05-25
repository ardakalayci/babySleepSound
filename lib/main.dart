import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'ui/home.dart';
import 'i18n.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      localizationsDelegates: [
        const I18nDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: I18nDelegate.supportedLocals,
      onGenerateTitle: (BuildContext context) => I18n.of(context).title,

      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: HomePage(),



    );
  }
}



