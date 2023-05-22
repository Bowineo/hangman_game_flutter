import 'package:flutter/material.dart';
import 'package:hangman_game/src/components/Background.dart';
import 'package:hangman_game/src/components/BoxLetter.dart';
import 'package:hangman_game/src/components/GenericButton.dart';
import 'package:hangman_game/src/components/HangmanImage.dart';
import 'package:hangman_game/src/components/Keyboard.dart';
import 'package:hangman_game/src/components/Result.dart';
import 'package:hangman_game/src/constants/helpers.dart';
import 'package:hangman_game/src/repository/ButtonStatus.dart';
import 'package:hangman_game/src/repository/Game.dart';
import 'package:hangman_game/src/repository/ListLetters.dart';
import 'package:hangman_game/src/screen/home.dart';
import 'package:provider/provider.dart';

class GamePage extends StatefulWidget {
  const GamePage({
    Key? key,
    required this.gender,
  }) : super(key: key);

  final int gender;

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  String _drawnWord = '';
  bool resetKeyboard = true;
  bool activated = false;
  String letter = '';
  ButtonStatus buttonStatus = ButtonStatus();
  ListLetters listLetters = ListLetters();
  bool hidden = true;

  @override
  void initState() {
    _drawnWord = getWordForGender(widget.gender);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: context.watch<Game>().endGame
          ? Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Background(),
              SingleChildScrollView(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * .6,
                        height: MediaQuery.of(context).size.height * .6,
                        child: Result(
                            function: playAgain,
                            word: _drawnWord,
                            victory: context.read<Game>().victory),
                      ),
                      GenericButton(
                        function: playAgain,
                        buttonTitle: 'Jogar',
                        width: MediaQuery.of(context).size.width * .2,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
          : Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Background(),
              SingleChildScrollView(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      HangmanImage(),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(2),
                          child: BoxLetter(
                            word: _drawnWord,
                            activated: activated,
                          ),
                        ),
                      ),
                      Keyboard(
                        listLetters: listLetters,
                        drawnWord: _drawnWord,
                        reset: resetKeyboard,
                        response: (String resp) {
                          activated = isActivated(resp);
                          letter = whatLetter(resp);
                        },
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
    );
  }

  void playAgain() {
    setState(() {
      resetKeyboard = true;
      _drawnWord = getWordForGender(widget.gender);
      buttonStatus.setAll(true);
      context.read<ListLetters>().clearListLetter();
      context.read<ButtonStatus>().setAll(true);
      context.read<Game>().setFalse();
      hidden = true;
    });
    Navigator.push(
        context, MaterialPageRoute(builder: ((context) => const Home())));
  }
}
