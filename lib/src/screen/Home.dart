import 'package:flutter/material.dart';
import 'package:hangman_game/src/components/Background.dart';
import 'package:hangman_game/src/components/GenericButton.dart';
import 'package:hangman_game/src/constants/helpers.dart';

import 'GamePage.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(alignment: AlignmentDirectional.center, children: [
        Background(),
        SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Text(
                    "Escolha um tema e vamos jogar!",
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.width * .05 < 18
                          ? 18
                          : MediaQuery.of(context).size.width * .05 > 24
                              ? 24
                              : MediaQuery.of(context).size.width * .05,
                    ),
                  ),
                ),
                GenericButton(
                  buttonTitle: "ANIMAIS",
                  function: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => GamePage(
                                  gender: kGenders.indexOf("ANIMAIS"),
                                ))));
                  },
                ),
                GenericButton(
                  buttonTitle: "FRUTAS",
                  function: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => GamePage(
                                  gender: kGenders.indexOf("FRUTAS"),
                                ))));
                  },
                ),
                GenericButton(
                  buttonTitle: "OBJETOS",
                  function: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => GamePage(
                                  gender: kGenders.indexOf("OBJETOS"),
                                ))));
                  },
                ),
                GenericButton(
                  buttonTitle: "PAÍSES",
                  function: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => GamePage(
                                  gender: kGenders.indexOf("PAÍSES"),
                                ))));
                  },
                ),
                GenericButton(
                  buttonTitle: "TODOS",
                  function: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => GamePage(
                                  gender: kGenders.indexOf("TODOS"),
                                ))));
                  },
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }

  void PlayGame(String gender) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: ((context) => GamePage(
                  gender: kGenders.indexOf(gender),
                ))));
  }
}
