import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animation_practice/customdesign.dart';

class Progressbar extends StatefulWidget {
  //final Size size;
  const Progressbar({super.key});

  @override
  State<Progressbar> createState() => _ProgressbarState();
}

class _ProgressbarState extends State<Progressbar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  static const int cl = 255;
  double changepacity = 0.3;
  int count = 1;
  bool forward = true;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: true); // infinite repeat
    _animation = Tween(
      begin: 0.0,
      end: 0.4,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInCubic));
    _animation.addListener(() {
      setState(() {
        changepacity = _animation.value;
      });
    });
    setState(() {
      if (forward) {
        count++;
        if (count >= 100) forward = false;
      } else {
        count--;
        if (count <= 1) forward = true;
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
    final size = MediaQuery.sizeOf(context);
    final Size(:width, :height) = size;
    final percentage = (changepacity * 100).round();
    Random random = Random();

    return Stack(
      children: [
        Positioned(
          left: 130,
          top: 100,
          child: Text(
            "Progress Bar",
            style: TextStyle(color: Colors.white, fontSize: 29),
          ),
        ),

        Align(
          alignment: Alignment.center,
          child: RotationTransition(
            turns: _animation,
            child: CustomPaint(
              painter: Customdesign(),

              size: Size(width * _animation.value, height * _animation.value),
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 350),
            child: Container(
              height: height * 0.02,
              width: width * 0.4,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
              ),

              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: height * 0.02,
                  width: width * _animation.value,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 429),
            child: Text(
              "loading... $percentage%",
              style: TextStyle(
                color: Color.fromARGB(
                  random.nextInt(cl),
                  random.nextInt(cl),
                  random.nextInt(cl),
                  random.nextInt(cl),
                ),
                fontSize: 21,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
