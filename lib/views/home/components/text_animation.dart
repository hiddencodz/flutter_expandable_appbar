import 'dart:async';

import 'package:flutter/material.dart';

class TextAnimation extends StatefulWidget {
  const TextAnimation({super.key});

  @override
  State<TextAnimation> createState() => _TextAnimationState();
}

class _TextAnimationState extends State<TextAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this,
        lowerBound: 10,
        upperBound: 30,
        duration: const Duration(milliseconds: 1000),
        reverseDuration: const Duration(milliseconds: 1000))
      ..repeat();
    _animationController.forward();
    Timer.periodic(const Duration(milliseconds: 1000), (value) {
      if (_animationController.isCompleted) {
        _animationController.reverse();
      } else {
        _animationController.forward();
      }
    });
    _animationController.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          print("h");
        },
        child: Text(
          "Learn\nCoding\n@HiddenCodz",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: _animationController.value,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 6, 64, 112)),
        ),
      ),
    );
  }
}
