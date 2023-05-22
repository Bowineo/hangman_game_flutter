import 'package:flutter/material.dart';
import 'package:hangman_game/src/constants/helpers.dart';

class GenericButton extends StatefulWidget {
  Function function;
  final String buttonTitle;
  final double? height;
  final double? width;

  GenericButton({
    Key? key,
    required this.function,
    required this.buttonTitle,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  State<GenericButton> createState() => _GenericButtonState();
}

class _GenericButtonState extends State<GenericButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
             kColorDefault),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(color: Colors.lightBlue.shade500))),
        ),
        onPressed: () {
          widget.function();
        },
        child: SizedBox(
          height: widget.height ?? MediaQuery.of(context).size.height * .06,
          width: widget.width ?? MediaQuery.of(context).size.width * .4,
          child: Center(
            child: Text(
              widget.buttonTitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: MediaQuery.of(context).size.height * .02,
                color: Colors.lightBlue.shade50,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
