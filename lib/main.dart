import 'package:flutter/material.dart';
import 'package:hangman_game/src/repository/ButtonStatus.dart';
import 'package:hangman_game/src/repository/Game.dart';
import 'package:hangman_game/src/repository/ListLetters.dart';
import 'package:hangman_game/src/screen/Splashscreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ListLetters()),
      ChangeNotifierProvider(create: (_) => ButtonStatus()),
      ChangeNotifierProvider(create: (_) => Game()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hangman game',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const Splashscreen(),
    );
  }
}
