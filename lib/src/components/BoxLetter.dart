import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../repository/ListLetters.dart';

class BoxLetter extends StatefulWidget {
  String word;
  bool activated;

  BoxLetter({
    Key? key,
    required this.word,
    required this.activated,
  }) : super(key: key);

  @override
  State<BoxLetter> createState() => _BoxLetterState();
}

class _BoxLetterState extends State<BoxLetter> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          color: Colors.transparent,
          width: widget.word.length * 30,
          height: MediaQuery.of(context).size.height * .08,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.word.length,
              itemBuilder: (context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(
                    left: 2,
                    right: 2,
                  ),
                  child: Container(
                    width: 25,
                    height: 40,
                    color: Colors.transparent,
                    child: Center(
                      child: Text(
                        context.watch<ListLetters>().listLetters.contains(widget
                                .word.characters
                                .elementAt(index)
                                .toUpperCase())
                            ? widget.word.characters
                                .elementAt(index)
                                .toUpperCase()
                            : "_",
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                );
              })),
    );
  }
}
