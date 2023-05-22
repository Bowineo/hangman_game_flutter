import 'package:flutter/material.dart';
import 'package:hangman_game/src/constants/helpers.dart';
import 'package:provider/provider.dart';
import '../repository/ButtonStatus.dart';
import '../repository/Game.dart';
import '../repository/ListLetters.dart';

class WordButton extends StatelessWidget {
  WordButton({
    Key? key,
    required this.buttonTitle,
    required this.index,
    required this.enable,
    required this.word,
  }) : super(key: key);

  final String buttonTitle;
  late bool enable;
  late int index;
  late String word;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(const Size(100, 40)),
        backgroundColor: context.watch<ButtonStatus>().buttonStatus[index]
            ? MaterialStateProperty.all<Color>(kColorDefault)
            : MaterialStateProperty.all<Color>(
                Colors.transparent,
              ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: Colors.lightBlue.shade500))),
      ),
      onPressed: context.watch<ButtonStatus>().buttonStatus[index]
          ? () {
              bool isLetterException = false;
              ListLetters listLetters =
                  Provider.of<ListLetters>(context, listen: false);
              if (kA.contains(buttonTitle)) {
                context.read<ListLetters>().setAllLetters(kA);
                isLetterException = true;
              }
              if (kE.contains(buttonTitle)) {
                context.read<ListLetters>().setAllLetters(kE);
                isLetterException = true;
              }
              if (kI.contains(buttonTitle)) {
                context.read<ListLetters>().setAllLetters(kI);
                isLetterException = true;
              }
              if (kO.contains(buttonTitle)) {
                context.read<ListLetters>().setAllLetters(kO);
                isLetterException = true;
              }
              if (kU.contains(buttonTitle)) {
                context.read<ListLetters>().setAllLetters(kU);
                isLetterException = true;
              }
              if (kC.contains(buttonTitle)) {
                context.read<ListLetters>().setAllLetters(kC);
                isLetterException = true;
              }
              if (!isLetterException) {
                context.read<ListLetters>().setLetter(buttonTitle);
              }
              context.read<ButtonStatus>().setIndex(false, index);
              context
                  .read<Game>()
                  .checking(buttonTitle, word, 6, listLetters.listLetters);
            }
          : null,
      child: Center(
        child: Text(
          buttonTitle,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: MediaQuery.of(context).size.width * .03 > 30 ? 30 : 16,
            color: context.watch<ButtonStatus>().buttonStatus[index]
                ? Colors.white
                : Colors.lightBlue.shade50,
          ),
        ),
      ),
    );
  }
}
