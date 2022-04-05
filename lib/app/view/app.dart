import 'package:flutter/material.dart';
import 'package:nasdaily_challenge/app/theme/theme.dart';
import 'package:nasdaily_challenge/home/home.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NasDaily Challenge',
      theme: NasDailyThemeData.theme(),
      home: const HomePage(),
    );
  }
}
