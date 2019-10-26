import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:running_trainer/Home/HomePage.dart';
import 'package:running_trainer/Utils/localizations.dart';

void main() => runApp(App());

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'RunningTrainer',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => HomePage(),
      },
      theme: ThemeData(
        accentColor: Colors.green,
        primaryColor: Color(0xffffffff),
        fontFamily: 'SUNDAY'
      ),
      initialRoute: '/',
      localizationsDelegates: [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('de'),
        Locale('en')
      ],
    );
  }
}

