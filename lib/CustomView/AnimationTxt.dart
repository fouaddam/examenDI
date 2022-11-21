

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class AnimationTxt extends StatelessWidget {
  final String text1,text2;
  const AnimationTxt({super.key, required this.text1, required this.text2});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AnimatedTextKit(
      animatedTexts: [
        RotateAnimatedText(text1,
            textStyle: const TextStyle(
                fontSize: 30,
                color: Colors.white,
                backgroundColor: Colors.transparent)),
        RotateAnimatedText(text1,
            textStyle: const TextStyle(
                letterSpacing: 3,
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.orange)),

      ],
      isRepeatingAnimation: true,
      totalRepeatCount: 10,
      pause: const Duration(milliseconds: 1000),
    );
  }
}