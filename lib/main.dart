import 'package:flutter/material.dart';
import 'package:flutter_animated_resume/slides/first_slide.dart';
import 'package:flutter_animated_resume/slides/second_slide.dart';
import 'package:flutter_animated_resume/slides/third_slide.dart';
import 'package:flutter_animated_resume/widgets/animated_positioned_ring.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Animated Resume | Bruno Alod',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(47, 191, 113, 1),
        scaffoldBackgroundColor: const Color.fromRGBO(16, 16, 26, 1),
        fontFamily: 'Poppins',
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int step = 0;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return MouseRegion(
      cursor: SystemMouseCursors.precise,
      child: Scaffold(
        body: Stack(
          children: [
            AnimatedPositionedRing(
              step: step,
              steps: [
                AnimatedPositionedRingData(
                  scale: 1,
                  bottom: screenHeight / 2 - 100,
                  left: screenWidth / 2,
                ),
                AnimatedPositionedRingData(
                  scale: 1,
                  bottom: -screenHeight / 2,
                  left: screenWidth / 2,
                ),
                AnimatedPositionedRingData(
                  scale: 5,
                  bottom: -screenHeight / 2,
                  left: screenWidth,
                ),
              ],
            ),
            AnimatedPositionedRing(
              step: step,
              steps: [
                AnimatedPositionedRingData(
                  scale: 1,
                  bottom: -screenHeight / 2 + 50,
                  right: screenWidth / 2,
                ),
                AnimatedPositionedRingData(
                  scale: 1,
                  bottom: screenHeight / 2,
                  right: screenWidth / 2,
                ),
                AnimatedPositionedRingData(
                  scale: 5,
                  bottom: screenHeight / 2,
                  right: screenWidth,
                ),
              ],
            ),
            AnimatedOpacity(
              opacity: step == 0 ? 1 : 0,
              curve: Curves.fastLinearToSlowEaseIn,
              duration: const Duration(milliseconds: 2500),
              child: const FirstSlide(),
            ),
            AnimatedPositioned(
              bottom: 0,
              top: 0,
              left: step == 1 ? 0 : -1500,
              curve: Curves.fastLinearToSlowEaseIn,
              duration: const Duration(milliseconds: 2500),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                child: const SecondSlide(),
              ),
            ),
            AnimatedOpacity(
              opacity: step == 2 ? 1 : 0,
              curve: Curves.fastLinearToSlowEaseIn,
              duration: const Duration(milliseconds: 2500),
              child: const ThirdSlide(),
            ),
            AnimatedOpacity(
              opacity: step == 2 ? 0 : 1,
              curve: Curves.fastLinearToSlowEaseIn,
              duration: const Duration(milliseconds: 2500),
              child: Align(
                alignment: const Alignment(0, 0.9),
                child: GestureDetector(
                  onTap: () {
                    Feedback.forTap(context);
                    setState(() {
                      step++;
                    });
                  },
                  child: Text(
                    'Tap to continue',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.75),
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
