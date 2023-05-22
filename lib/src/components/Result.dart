import 'package:flutter/material.dart';
import '../constants/helpers.dart';

class Result extends StatefulWidget {
  Function function;

  final bool victory;
  final String word;
  Result({
    Key? key,
    required this.function,
    required this.victory,
    required this.word,
  }) : super(key: key);

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(4),
          child: Text(
            widget.victory ? 'Você ganhou!' : 'Você perdeu!',
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: MediaQuery.of(context).size.width * .05 < 16
                  ? 16
                  : MediaQuery.of(context).size.width * .05 > 24
                      ? 24
                      : MediaQuery.of(context).size.width * .05,
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(2),
            child: Image.asset(
              widget.victory ? kWon : kItLost,
              height: MediaQuery.of(context).size.height * .25,
              width: MediaQuery.of(context).size.width * .4,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(4),
          child: Text(
            'A palavra era: ',
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: MediaQuery.of(context).size.width * .05 < 16
                  ? 16
                  : MediaQuery.of(context).size.width * .05 > 24
                      ? 24
                      : MediaQuery.of(context).size.width * .05,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(4),
          child: Text(
            widget.word.toUpperCase(),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: MediaQuery.of(context).size.width * .05 < 16
                  ? 26
                  : MediaQuery.of(context).size.width * .05 > 24
                      ? 24
                      : MediaQuery.of(context).size.width * .05,
            ),
          ),
        ),
      ],
    );
  }
}
