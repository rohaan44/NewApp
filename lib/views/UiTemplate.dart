import 'package:flutter/material.dart';
import 'dart:ui';

class Uitemplate extends StatelessWidget {
  const Uitemplate({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomGradient(
          width: 200,
          height: 200,
          alignment: Alignment.topLeft,
          colors: [
            const Color.fromARGB(144, 33, 149, 243).withOpacity(0.25),
            const Color.fromARGB(183, 33, 149, 243).withOpacity(0.20),
          ],
          blurSigma: 50,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 130),
          child: CustomGradient(
            width: 170,
            height: 170,
            alignment: Alignment.topLeft,
            colors: [
              const Color.fromARGB(82, 155, 39, 176).withOpacity(0.2),
              const Color.fromARGB(69, 155, 39, 176).withOpacity(0.0),
            ],
            blurSigma: 40,
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: RotationTransition(
            turns: const AlwaysStoppedAnimation(180 / 360),
            child: CustomGradient(
              width: 200,
              height: 200,
              alignment: Alignment.bottomRight,
              colors: [
                const Color.fromARGB(59, 155, 39, 176).withOpacity(0.25),
                const Color.fromARGB(45, 155, 39, 176).withOpacity(0.0),
              ],
              blurSigma: 50,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 30),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: RotationTransition(
              turns: const AlwaysStoppedAnimation(180 / 360),
              child: CustomGradient(
                width: 170,
                height: 170,
                alignment: Alignment.bottomCenter,
                colors: [
                  const Color.fromARGB(103, 33, 149, 243).withOpacity(0.2),
                  const Color.fromARGB(111, 33, 149, 243).withOpacity(0.0),
                ],
                blurSigma: 50,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomGradient extends StatelessWidget {
  final double width;
  final double height;
  final AlignmentGeometry alignment;
  final List<Color> colors;
  final double blurSigma;

  const CustomGradient({
    Key? key,
    required this.width,
    required this.height,
    required this.alignment,
    required this.colors,
    this.blurSigma = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.center,
            radius: 1.0,
            colors: colors,
          ),
        ),
        child: blurSigma > 0
            ? BackdropFilter(
                filter: ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
                child: Container(
                  color: Colors.transparent,
                ),
              )
            : null,
      ),
    );
  }
}
