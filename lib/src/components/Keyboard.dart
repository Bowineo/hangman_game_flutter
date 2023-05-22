import 'package:flutter/material.dart';
import 'package:hangman_game/src/components/WordButton.dart';
import '../repository/Alphabet.dart';
import '../repository/ButtonStatus.dart';
import '../repository/ListLetters.dart';

class Keyboard extends StatefulWidget {
  String drawnWord;
  bool reset;
  ListLetters listLetters;
  final Function(String) response;

  Keyboard({
    Key? key,
    required this.drawnWord,
    required this.reset,
    required this.response,
    required this.listLetters,
  }) : super(key: key);

  @override
  State<Keyboard> createState() => _KeyboardState();
}

class _KeyboardState extends State<Keyboard> {
  Alphabet ptAlphabet = Alphabet();
  ButtonStatus buttonStatus = ButtonStatus();

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
      width: MediaQuery.of(context).size.width * .9,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(10.0, 2.0, 4, 10.0),
            child: Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                TableRow(children: [
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: createButton(0),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: createButton(1),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: createButton(2),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: createButton(3),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: createButton(4),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: createButton(5),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: createButton(6),
                    ),
                  ),
                ]),
                TableRow(children: [
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: createButton(7),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: createButton(8),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: createButton(9),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: createButton(10),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: createButton(11),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: createButton(12),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: createButton(13),
                    ),
                  ),
                ]),
                TableRow(children: [
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: createButton(14),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: createButton(15),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: createButton(16),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: createButton(17),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: createButton(18),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: createButton(19),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: createButton(20),
                    ),
                  ),
                ]),
                TableRow(children: [
                  const TableCell(
                    child: Padding(
                      padding: EdgeInsets.all(4),
                      child: Text(''),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: createButton(21),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: createButton(22),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: createButton(23),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: createButton(24),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: createButton(25),
                    ),
                  ),
                  const TableCell(
                    child: Padding(
                      padding: EdgeInsets.all(4),
                      child: Text(''),
                    ),
                  ),
                ]),
              ],
            ),
          ),
        ],
      ),
    ));
  }

  Widget createButton(index) {
    return Center(
        child: WordButton(
      word: widget.drawnWord,
      index: index,
      enable: buttonStatus.buttonStatus[index],
      buttonTitle: ptAlphabet.alphabet[index].toUpperCase(),
    ));
  }
}
