import 'package:flutter/material.dart';
import 'package:hangman_game/src/constants/helpers.dart';

class Background extends StatelessWidget {
  const Background({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(kImageBackground),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
