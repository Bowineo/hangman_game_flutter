import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../repository/Game.dart';
import 'FigureImage.dart';

class HangmanImage extends StatefulWidget {
  const HangmanImage({Key? key}) : super(key: key);

  @override
  State<HangmanImage> createState() => _HangmanImageState();
}

class _HangmanImageState extends State<HangmanImage> {
  @override
  Widget build(BuildContext context) {
    int attemptCount = context.read<Game>().attemptCount;
    return Center(
      child: Stack(
        children: [
          figureImage(attemptCount >= 0, 'assets/images/0.png'),
          figureImage(attemptCount >= 1, 'assets/images/1.png'),
          figureImage(attemptCount >= 2, 'assets/images/2.png'),
          figureImage(attemptCount >= 3, 'assets/images/3.png'),
          figureImage(attemptCount >= 4, 'assets/images/4.png'),
          figureImage(attemptCount >= 5, 'assets/images/5.png'),
          figureImage(attemptCount >= 6, 'assets/images/6.png'),
        ],
      ),
    );
  }
}
