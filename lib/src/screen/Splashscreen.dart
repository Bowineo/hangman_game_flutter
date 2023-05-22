import 'package:flutter/material.dart';
import 'package:hangman_game/src/constants/helpers.dart';
import 'Home.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _sizeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 3400),
      vsync: this,
    )..forward();
    _sizeAnimation = Tween<double>(begin: 0.2, end: 1).animate(_controller);
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Home()),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: kColorDefault,
            ),
            Center(
              child: AnimatedBuilder(
                animation: _sizeAnimation,
                builder: (context, child) {
                  return Container(
                    width: MediaQuery.of(context).size.width *
                        _sizeAnimation.value,
                    height: MediaQuery.of(context).size.height *
                        _sizeAnimation.value,
                    decoration:  BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0), 
                      image: const DecorationImage(
                        image: AssetImage(kImageSplashScreen),
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
